// ignore_for_file: unused_local_variable

import 'package:flashcard_quiz_app/model/Question_Model.dart';
import 'package:flashcard_quiz_app/model/dbConnect.dart';
import 'package:flashcard_quiz_app/pages/splashScreen.dart';
import 'package:flutter/material.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'FlashCard Quiz',
      home: Splashscreen(),
    );
  }
}
