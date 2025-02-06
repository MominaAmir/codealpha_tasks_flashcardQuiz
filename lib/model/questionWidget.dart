// ignore_for_file: file_names

import 'package:flashcard_quiz_app/model/constant.dart';
import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    super.key, required this.question, required this.indexAction, required this.totalQuestion,
    });

    final String question;
    final int indexAction;
    final int totalQuestion;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text('Questions: ${indexAction +1}/$totalQuestion: $question',style: const TextStyle(
        fontSize: 24,
        color: neutral
      )),
    );
  }
}