import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeView extends StatefulWidget {
  const DateTimeView({super.key});

  @override
  State<DateTimeView> createState() => _DateTimeViewState();
}

class _DateTimeViewState extends State<DateTimeView> {
  DateTime dateTime = DateTime.now();
  int fontSizeBase = 0;

  double sizeWithBase(int size) => fontSizeBase + size * 1.0;

  void updateSizeBase(Size size) {
    final width = size.width;
    final height = size.height;

    final baseSize = width > height ? height : width;

    setState(() {
      fontSizeBase = baseSize ~/ 10;
    });
  }

  void startClock() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        dateTime = DateTime.now();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    startClock();
  }

  @override
  Widget build(BuildContext context) {
    final date = DateFormat('E MMMM d, y').format(dateTime);

    final timeHM = DateFormat('hh:mm').format(dateTime);
    final timeS = DateFormat('ss').format(dateTime);

    updateSizeBase(MediaQuery.sizeOf(context));

    return Flex(direction: Axis.vertical, children: [
      Text.rich(
          TextSpan(children: [
            TextSpan(
                text: timeHM,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: sizeWithBase(100),
                    fontWeight: FontWeight.bold)),
            TextSpan(
                text: ' $timeS',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: sizeWithBase(50),
                    fontWeight: FontWeight.bold))
          ]),
          textAlign: TextAlign.center),
      Text(date,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: sizeWithBase(50),
              fontWeight: FontWeight.bold))
    ]);
  }
}