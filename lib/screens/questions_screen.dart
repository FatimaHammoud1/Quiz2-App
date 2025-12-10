import 'package:flutter/material.dart';
import '../data/questions.dart';
import '../widgets/question_item.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
    required this.submit,
  });

  final Function(int index, String answer) onSelectAnswer;
  final void Function() submit;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            //asMap is a function that creates a map of the list.
            //The map uses the indices of this list as keys and the corresponding objects as values.
            ...questions.asMap().entries.map((entry) {
              int qIndex = entry.key;
              var question = entry.value;

              return QuestionItem(
                questionIndex: qIndex,
                question: question,
                onSelectAnswer: onSelectAnswer,
              );
            }),

            const SizedBox(height: 20),
            ElevatedButton(onPressed: submit, child: Text("Submit")),
          ],
        ),
      ),
    );
  }
}
