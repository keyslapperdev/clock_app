import 'dart:async';

class ClockTimerService {
  static late Duration _duration;
  static Timer? _timer;
  static int _elapsed = 0;
  static bool _showTimer = false;

  static bool get showTimer => _showTimer;

  static void init(Duration duration) => _duration = duration;

  static void start([bool showTimer = true]) {
    _timer ??=
        Timer.periodic(const Duration(seconds: 1), (timer) => _elapsed++);
    _showTimer = showTimer;
  }

  static void stop([bool showTimer = false]) {
    _timer?.cancel();
    _timer = null;
    _showTimer = showTimer;
  }

  static void set(Duration duration, [bool showTimer = true]) {
    _duration = duration;
    reset(showTimer);
  }

  static void reset([bool showTimer = true]) {
    _elapsed = 0;
    stop(showTimer);
  }

  static String get remaining {
    final remaining = _duration.inSeconds - _elapsed;
    final seconds = remaining % 60;
    final minutes = remaining ~/ 60;

    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }
}
