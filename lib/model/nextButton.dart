// ignore_for_file: file_names

import 'package:flashcard_quiz_app/model/constant.dart';
import 'package:flutter/material.dart';

class Nextbutton extends StatelessWidget {
  const Nextbutton ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        color: neutral,
        borderRadius: BorderRadius.circular(10)
      ),
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: const Text("Next Button", textAlign: TextAlign.center,),
    );
  }
}