import 'package:flutter/material.dart';
import 'package:true_or_false_app/quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: QuizApp(),
          ),
        ),
      ),
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List<Icon> scoreKeeper = [];

  ///Preview of the questions and answers
  /*  List<String> questions = [
    'Lionel Messi has won more Ballon d\'Or awards than Cristiano Ronaldo.',
    'The FIFA World Cup is held every 3 years.',
    'Barcelona and Real Madrid are the two main football clubs in Spain.',
    'The Brazilian national football team has won more World Cups than any other country.',
    '"The Hand of God" goal was scored by Diego Maradona in the 1986 World Cup.',
    'The all-time leading goal scorer in the history of the World Cup is Pelé.',
    'American football and football (soccer) are the same sport.',
    'The official ball of the FIFA World Cup is called the "Telstar."',
    'VAR (Video Assistant Referee) is used in all football competitions.',
    'The highest goal scorer in a single season of the UEFA Champions League is Cristiano '
        'Ronaldo.',
  ];

  List<bool> answers = [
    true,
    false,
    true,
    true,
    true,
    false,
    false,
    true,
    false,
    true,
  ];
  */

  void addCheckIcon() {
    setState(() {
      scoreKeeper.add(
        const Icon(
          Icons.check,
          color: Colors.green,
        ),
      );
    });
  }

  void addCancelIcon() {
    setState(() {
      scoreKeeper.add(
        const Icon(
          Icons.close,
          color: Colors.red,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Center(
            child: Text(
              quizBrain.getQuestionText(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: () {
                  setState(() {
                    bool correctAnswer = quizBrain.getQuestionAnswer();

                    if (correctAnswer == true) {
                      addCheckIcon();
                    } else {
                      addCancelIcon();
                    }
                    quizBrain.nextQuestion();
                  });
                },
                child: const Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  bool correctAnswer = quizBrain.getQuestionAnswer();

                  if (correctAnswer == false) {
                    addCheckIcon();
                  } else {
                    addCancelIcon();
                  }

                  quizBrain.nextQuestion();
                },
                child: const Text(
                  'False',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
