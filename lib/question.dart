class Question {
  late String questionText;
  late bool questionAnswer;

  // Constructor
  Question({required String question, required bool answer}) {
    questionText = question;
    questionAnswer = answer;
  }
}
