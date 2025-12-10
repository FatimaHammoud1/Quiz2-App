import 'package:fatima_hammoud/screens/questions_screen.dart';
import 'package:fatima_hammoud/screens/result_screen.dart';
import 'package:fatima_hammoud/widgets/question_item.dart';
import 'package:flutter/material.dart';
import 'data/questions.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  // selectedAnswers is initially filled with empty strings indicating that the question is not yet answered.
  List<String> selectedAnswers = List.filled(questions.length, "");

  String activeScreenName = "questions-screen";

  void _restart() {
    setState(() {
      selectedAnswers = List.filled(questions.length, "");
      activeScreenName = 'questions-screen';
    });
  }

  int get numberOfCorrectAnswers {
    int count = 0;
    for (int i = 0; i < questions.length; i++) {
      if (selectedAnswers[i] == questions[i].correctAnswer) {
        count++;
      }
    }
    return count;
  }

  void _submit() {
    setState(() {
      activeScreenName = 'result-screen';
    });
  }

  void _selectAnswer(int index, String answer) {
    setState(() {
      selectedAnswers.add(answer);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget? activeScreen;
    if (activeScreenName == 'questions-screen') {
      activeScreen = QuestionsScreen(
        onSelectAnswer: _selectAnswer,
        submit: _submit,
      );
    } else if (activeScreenName == 'result-screen') {
      activeScreen = ResultScreen(
        onRestart: _restart,
        score: numberOfCorrectAnswers,
      );
    }

    return Scaffold(backgroundColor: Colors.green, body: activeScreen);
  }
}
