import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart';
import 'package:clock_app/src/service/clock_timer_service.dart';

class ClockServer {
  static Future<void> start() async {
    final app = Router();
    app.get('/health', (Request request) => Response.ok('OK'));
    app.get('/start', _startHandler);
    app.get('/stop', _stopHandler);
    app.get('/reset', _resetHandler);
    app.post('/set', _setHandler);

    final handler =
        const Pipeline().addMiddleware(logRequests()).addHandler(app);

    final server = await shelf_io.serve(handler, 'localhost', 8080);
    print('Server running on ${server.address}:${server.port}');
  }

  static Response _startHandler(Request _) {
    ClockTimerService.start();
    return Response.ok('Started the clock');
  }

  static Response _stopHandler(Request _) {
    ClockTimerService.stop();
    return Response.ok('Stopped the clock');
  }

  static Response _resetHandler(Request _) {
    ClockTimerService.reset();
    return Response.ok('Reset the clock');
  }

  static Future<Response> _setHandler(Request request) async {
    final body = await request.readAsString();

    final data = jsonDecode(body);

    final seconds = data['seconds'] as int;
    final minutes = data['minutes'] as int;
    ClockTimerService.set(Duration(seconds: seconds, minutes: minutes));

    return Response.ok('Set the clock');
  }
}
