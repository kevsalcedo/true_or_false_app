import 'package:true_or_false_app/question.dart';
import 'package:true_or_false_app/main.dart';
import 'main.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question(
      question:
          'Lionel Messi has won more Ballon d\'Or awards than Cristiano Ronaldo.',
      answer: true,
    ),
    Question(
      question: 'The FIFA World Cup is held every 3 years.',
      answer: false,
    ),
    Question(
      question:
          'Barcelona and Real Madrid are the two main football clubs in Spain.',
      answer: true,
    ),
    Question(
      question:
          'The Brazilian national football team has won more World Cups than any other country.',
      answer: true,
    ),
    Question(
      question:
          '"The Hand of God" goal was scored by Diego Maradona in the 1986 World Cup.',
      answer: true,
    ),
    Question(
      question:
          'The all-time leading goal scorer in the history of the World Cup is Pelé.',
      answer: false,
    ),
    Question(
      question: 'American football and football (soccer) are the same sport.',
      answer: false,
    ),
    Question(
      question:
          'The official ball of the FIFA World Cup is called the "Telstar."',
      answer: true,
    ),
    Question(
      question:
          'VAR (Video Assistant Referee) is used in all football competitions.',
      answer: false,
    ),
    Question(
      question:
          'The highest goal scorer in a single season of the UEFA Champions League is Cristiano Ronaldo.',
      answer: true,
    ),
  ];

  String getQuestionText() {
    return _questionBank[_questionNumber].question;
  }

  bool getQuestionAnswer() {
    return _questionBank[_questionNumber].answer;
  }

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      print('Now returning true');
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
