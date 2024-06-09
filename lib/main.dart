import 'package:clock_app/src/widgets/date_time_view.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';

void main() async {
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
        child: const Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                DateTimeView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
