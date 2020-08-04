import 'package:flutter/material.dart';
import 'package:vibrate/vibrate.dart';
import 'dart:async';

class TimerUI extends StatefulWidget {
  @override
  _TimerUIState createState() => _TimerUIState();
}

class _TimerUIState extends State<TimerUI> {
  static const int _workPeriod = 10; //* 60;
  Stopwatch _stopwatch;
  String _timerText;

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
    _timerText = "";
    Timer.periodic(Duration(seconds: 1), (Timer t) => _draw());
  }

  void _startAlarm() {
    _stopwatch.start();
  }

  void _stopAlarm() {
    _stopwatch.stop();
  }

  void _resetAlarm() {
    _stopwatch.stop();
    _stopwatch.reset();
  }

  void _draw() {
    int left = _workPeriod - _stopwatch.elapsed.inSeconds;
    print("draw");

    if (left <= 0) {
      _resetAlarm();
      _vibrate();
    }

    setState(() {
      _timerText =
          "${(left / 60).floor()}:${(left % 60).toString().padLeft(2, '0')}";
    });
  }

  void _vibrate() {
    Vibrate.feedback(FeedbackType.heavy);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            _timerText,
            style: Theme.of(context).textTheme.display3,
          ),
          SizedBox(
            height: 40,
          ),
          OutlineButton(
            onPressed: () {
              _startAlarm();
            },
            child: const Text('Start', style: TextStyle(fontSize: 20)),
          ),
        ]);
  }
}
