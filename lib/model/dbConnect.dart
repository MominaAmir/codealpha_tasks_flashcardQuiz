// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';

import 'package:flashcard_quiz_app/model/Question_Model.dart';
import 'package:http/http.dart' as http;

class DBConnect {


  Future<void> addQuestion(Questions quest , String quizName)async {
  final url = Uri.parse(
      "https://flashcard-quiz-app-9d854-default-rtdb.firebaseio.com/${quizName}.json");
    await http.post(url, body: json.encode({
      'title': quest.question,
      'options': quest.options,
    }));
  }

  Future<List<Questions>> FetchQuestions(String quizname) async {
  final url = Uri.parse(
      "https://flashcard-quiz-app-9d854-default-rtdb.firebaseio.com/$quizname.json");
    return http.get(url).then((response) {
      var data = json.decode(response.body) as Map<String, dynamic>;
      List<Questions> newQuestions = [];
      data.forEach(
        (key, value) {
          var newQuestion = Questions(
              id: key, question: value['title'], options: Map.castFrom(value['options']));
      newQuestions.add(newQuestion);
        },
      );
      return newQuestions;
    });
  }
}
