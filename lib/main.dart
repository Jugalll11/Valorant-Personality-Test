import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite agent',
      'answers': [
        {'text': 'Astra', 'score': 4},
        {'text': 'Omen', 'score': 3},
        {'text': 'Killjoy', 'score': 2},
        {'text': 'jett', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite Weapon?',
      'answers': [
        {'text': 'Odin', 'score': 1},
        {'text': 'Marshal', 'score': 4},
        {'text': 'operator', 'score': 2},
        {'text': 'Vandal', 'score': 3},
      ],
    },
    {
      'questionText': 'Who\'s your favorite Map',
      'answers': [
        {'text': 'Split', 'score': 2},
        {'text': 'Ascent', 'score': 3},
        {'text': 'Breeze', 'score': 4},
        {'text': 'Fracture', 'score': 1},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    // var aBool = true;
    // aBool = false;

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    // var dummy = const ['Hello'];
    // dummy.add('Max');
    // print(dummy);
    // dummy = [];
    // questions = []; // does not work if questions is a const

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
