import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './result.dart';
import './quiz.dart';

main() => runApp(QuizApp());

class _QuizAppState extends State<QuizApp> {
  final _questions = const [
    {
      'question': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'White', 'score': 7},
        {'text': 'Red', 'score': 5},
        {'text': 'Blue', 'score': 3},
        {'text': 'Green', 'score': 1},
        {'text': 'Yellow', 'score': 0},
      ]
    },
    {
      'question': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Snake', 'score': 7},
        {'text': 'Elephant', 'score': 3},
        {'text': 'Lion', 'score': 0},
      ]
    },
    {
      'question': 'What\'s your favorite professor?',
      'answers': [
        {'text': 'Mariah', 'score': 10},
        {'text': 'John', 'score': 7},
        {'text': 'Leonard', 'score': 3},
        {'text': 'Peter', 'score': 1},
      ]
    }
  ];

  var _questionSelected = 0;
  var _score = 0;

  void _response(int score) {
    setState(() {
      _questionSelected++;
      _score += score;
    });
  }

  void _restart() {
    setState(() {
      _questionSelected = 0;
      _score = 0;
    });
  }

  bool get hasQuestionSelected {
    return _questionSelected < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Quiz'),
          ),
          body: hasQuestionSelected
              ? Quiz(
                  questionSelected: _questionSelected,
                  questions: _questions,
                  onResponse: _response)
              : Result(_score, _restart)),
    );
  }
}

class QuizApp extends StatefulWidget {
  _QuizAppState createState() {
    return _QuizAppState();
  }
}
