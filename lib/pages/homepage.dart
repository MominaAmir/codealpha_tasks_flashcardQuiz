import 'package:flashcard_quiz_app/model/constant.dart';
import 'package:flashcard_quiz_app/pages/addQuestion.dart';
import 'package:flashcard_quiz_app/pages/questionPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FlashCard Quiz',
          style: TextStyle(
              color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/assets/images/bg.jpg'),
                fit: BoxFit.cover)),
        child: GridView.count(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 20, // Horizontal spacing between items
          mainAxisSpacing: 30, // Vertical spacing between items
          padding: const EdgeInsets.all(10),
          children: [
             GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const QuestionPage()));
              },
               child: Container(
                child: Card(
                  color: Colors.black54,
                  margin: const EdgeInsets.all(0),
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      child: Center(
                          child: Text(
                        "Math",
                        style: TextStyle(color: neutral, fontSize: 25),
                      ))),
                ),
                           ),
             ),
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddQuestions()));
            },
            child: Container(
                child: Card(
                  color: Colors.black54,
                  margin: const EdgeInsets.all(0),
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      child: Center(
                          child: Icon(Icons.add, size: 20, color: Colors.white,))),
                ),  
                    ),
          ),]
        ),
      ),
    );
  }
}




