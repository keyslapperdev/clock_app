import 'dart:async';

import 'package:clock_app/src/service/clock_timer_service.dart';
import 'package:flutter/material.dart';

class ClockTimerView extends StatefulWidget {
  const ClockTimerView({super.key});

  @override
  State<ClockTimerView> createState() => _ClockTimerViewState();
}

class _ClockTimerViewState extends State<ClockTimerView> {
  String _timerDisplay = '';
  bool _showTimer = false;

  @override
  void initState() {
    super.initState();

    ClockTimerService.init(const Duration());
    _timerDisplay = ClockTimerService.remaining;
  }

  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(seconds: 1),
        (_) => setState(() { 
          _timerDisplay = ClockTimerService.remaining;
          _showTimer = ClockTimerService.showTimer;
        }));

    return _showTimer 
        ? Card(
            color: Colors.lightBlue,
            child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Text(_timerDisplay,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 100,
                        fontWeight: FontWeight.bold))))
        : Container();
  }
}
