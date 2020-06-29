import 'package:flutter/material.dart';
import './question.dart';
import './response.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionSelected;
  final void Function(int) onResponse;

  Quiz({
    @required this.questions,
    @required this.questionSelected,
    @required this.onResponse,
  });

  bool get hasQuestionSelected {
    return questionSelected < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers =
        hasQuestionSelected ? questions[questionSelected]['answers'] : null;

    return Column(
      children: <Widget>[
        Question(questions[questionSelected]['question']),
        ...answers
            .map((resp) => Response(
                  resp['text'],
                  () => onResponse(resp['score'])
                ))
            .toList(),
      ],
    );
  }
}
