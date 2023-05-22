import 'package:flutter/material.dart';
import 'package:true_or_false_app/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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

  int score = 0;

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getQuestionAnswer();

    setState(() {
      if (correctAnswer == userPickedAnswer) {
        scoreKeeper.add(
          const Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
        score++;
      } else {
        scoreKeeper.add(
          const Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }
      quizBrain.nextQuestion();
    });
  }

  void isFinished() {
    if (quizBrain.isFinished() == true) {
      showAlertDialog();
    }
  }

  void showAlertDialog() {
    var alertStyle = AlertStyle(
      animationType: AnimationType.grow,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: TextStyle(fontWeight: FontWeight.bold),
      descTextAlign: TextAlign.center,
      animationDuration: Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
        side: BorderSide(
          color: Colors.grey,
        ),
      ),
      titleStyle: TextStyle(
        color: Colors.red,
      ),
      alertAlignment: Alignment.topCenter,
    );

    Alert(
      context: context,
      style: alertStyle,
      type: AlertType.info,
      title: "QUIZ FINISHED",
      desc: "Your score is $score/10.",
      buttons: [
        DialogButton(
          child: Text(
            "RESET QUIZ",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            setState(() {
              Navigator.pop(context);
              quizBrain.reset();
              scoreKeeper = [];
            });
          },
          color: Color.fromRGBO(0, 179, 134, 1.0),
          radius: BorderRadius.circular(0.0),
        ),
      ],
    ).show();
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
                    checkAnswer(true);
                    isFinished();
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
                  checkAnswer(false);
                  isFinished();
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
