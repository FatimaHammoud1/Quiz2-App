class QuizQuestion {
  final String text;
  final List<String> answers;
  final String correctAnswer;
  final List<String> shuffledAnswers;

  QuizQuestion({
    required this.answers,
    required this.correctAnswer,
    required this.text,
  }) : shuffledAnswers = List.of(answers)..shuffle();
}
