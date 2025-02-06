// ignore_for_file: sort_child_properties_last

import 'package:flashcard_quiz_app/model/constant.dart';
import 'package:flashcard_quiz_app/model/dbConnect.dart';
import 'package:flashcard_quiz_app/model/nextButton.dart';
import 'package:flashcard_quiz_app/model/questionWidget.dart';
import 'package:flutter/material.dart';
import 'package:flashcard_quiz_app/model/Question_Model.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  var db = DBConnect();
  late Future _questions;

  Future<List<Questions>> getdata() async {
    return db.FetchQuestions("mathsquestions");
  }

  @override
  void initState() {
    _questions = getdata();
    super.initState();
  }


  int index = 0;

  bool alreadySelected = false;
  void nextQuestion(int questionLength) {
    if (index == questionLength - 1) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (ctx) => AlertDialog(
                backgroundColor: const Color.fromARGB(255, 6, 1, 77),
                content: Padding(
                  padding: const EdgeInsets.all(70),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Result",
                        style: TextStyle(
                          color: neutral,
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CircleAvatar(
                          child: Text("$score/$questionLength",
                              style: const TextStyle(fontSize: 30)),
                          radius: 70,
                          backgroundColor: score == questionLength / 2
                              ? Colors.yellow
                              : score < questionLength / 2
                                  ? incorrect
                                  : correct),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        score == questionLength / 2
                            ? "Almost Their"
                            : score < questionLength / 2
                                ? "Try Again"
                                : "Great!!",
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      GestureDetector(
                          onTap: () {
                            startOver();
                          },
                          child: const Text(
                            "Start Over",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                                letterSpacing: 1.0),
                          ))
                    ],
                  ),
                ),
              ));
    } else {
      if (isPressed) {
        setState(() {
          index++;
          isPressed = false;
          alreadySelected = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Please Select Any option first"),
          behavior: SnackBarBehavior.floating,
        ));
      }
    }
  }

  bool isPressed = false;

  void checkAnswer(bool value) {
    if (alreadySelected) {
      return;
    } else {
      if (value == true) {
        score++;
      }
      setState(() {
        isPressed = true;
        alreadySelected = true;
      });
    }
  }

  void startOver() {
    setState(() {
      index = 0;
      score = 0;
      isPressed = false;
      alreadySelected = false;
    });
    Navigator.pop(context);
  }

  int score = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _questions as Future<List<Questions>>,
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Error has Occur"),
            );
          } else if (snapshot.hasData) {
            var extractedData = snapshot.data as List<Questions>;
            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Maths Quiz',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
                centerTitle: true,
                backgroundColor: Colors.black,
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: Text(
                      "SCORE = $score",
                      style: const TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              body: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('lib/assets/images/bg.jpg'),
                        fit: BoxFit.cover)),
                child: Card(
                  color: Colors.black54,
                  margin: const EdgeInsets.all(50),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: Column(
                      children: [
                        QuestionWidget(
                            question: extractedData[index].question,
                            indexAction: index,
                            totalQuestion: extractedData.length),
                        const Divider(
                          color: neutral,
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        for (int i = 0;
                            i < extractedData[index].options.length;
                            i++)
                          GestureDetector(
                            onTap: () => checkAnswer(
                                extractedData[index].options.values.toList()[i]),
                            child: Card(
                                child: ListTile(
                                    title: Text(
                                  extractedData[index].options.keys.toList()[i],
                                  style: const TextStyle(
                                    fontSize: 22,
                                  ),
                                )),
                                color: isPressed
                                    ?extractedData[index]
                                                .options
                                                .values
                                                .toList()[i] ==
                                            true
                                        ? correct
                                        : incorrect
                                    : neutral),
                          )
                      ],
                    ),
                  ),
                ),
              ),
              floatingActionButton: GestureDetector(
                onTap: (){
                  nextQuestion(extractedData.length);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Nextbutton(),
                ),
              ),
            );
          }
        }else{
          return const Center(child: CircularProgressIndicator());
        }
        return const Center(child: Text("No Data"),);
      },
    );
  }
}
