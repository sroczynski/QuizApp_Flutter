import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final void Function() onRestart;

  Result(this.score, this.onRestart);

  String get resultPhrase {
    if (score < 8)
      return 'Congratulations!';
    else if (score < 12)
      return 'You rock!';
    else if (score < 18)
      return 'Awesome!!!';
    else
      return 'Jedi level!';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(resultPhrase, style: TextStyle(fontSize: 28)),
        ),
        FlatButton(
          child: Text('Restart'),
          textColor: Colors.blue,
          onPressed: onRestart,
        )
      ],
    );
  }
}
