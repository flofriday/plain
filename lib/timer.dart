import 'package:flutter/material.dart';
import 'package:vibrate/vibrate.dart';

class TimerUI extends StatefulWidget {
  @override
  _TimerUIState createState() => _TimerUIState();
}

class _TimerUIState extends State<TimerUI> {
  int _left;

  @override
  void initState() {
    super.initState();
    _left = 25 * 60;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "${(_left / 60).floor()}:${(_left % 60).toString().padLeft(2, '0')}",
            style: Theme.of(context).textTheme.display3,
          ),
          SizedBox(
            height: 40,
          ),
          OutlineButton(
            onPressed: () {
              Vibrate.feedback(FeedbackType.medium);

              setState(() {
                _left -= 1;
              });
            },
            child: const Text('Start', style: TextStyle(fontSize: 20)),
          ),
        ]);
  }
}
