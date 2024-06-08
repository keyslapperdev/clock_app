import 'package:clock_app/src/server/server.dart';
import 'package:clock_app/src/widgets/clock_timer_view.dart';
import 'package:clock_app/src/widgets/date_time_view.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';

void main() async {
  ClockServer.start();

  runApp(const ClockApp());
}

class ClockApp extends StatelessWidget {
  const ClockApp({super.key});

  @override
  Widget build(BuildContext context) {

    // Duration remaining = Duration(minutes: 1) - Duration(seconds: 61);
    Duration remaining = Duration(minutes: -1);
    // String seconds = ;

    return MaterialApp(
      theme: ThemeData(fontFamily: 'FiraCode'),
      home: GestureDetector(
        onDoubleTap: () => DesktopWindow.toggleFullScreen(),
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${remaining.inSeconds ~/ 60}',
                  // seconds,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // ClockTimerView(),
                // SizedBox(height: 50),
                // DateTimeView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}