import 'package:flashcard_quiz_app/model/Question_Model.dart';
import 'package:flutter/material.dart';
import 'package:flashcard_quiz_app/model/dbConnect.dart';  // Import your DBConnect class

class AddQuestions extends StatefulWidget {
  const AddQuestions({super.key});

  @override
  State<AddQuestions> createState() => _AddQuestionsState();
}

class _AddQuestionsState extends State<AddQuestions> {
  final _quizName = TextEditingController();
  final _questionController = TextEditingController();
  final _answerController1 = TextEditingController();
  final _answerController2= TextEditingController();
  final _answerController3 = TextEditingController();
  final _answerController4 = TextEditingController();
  final idController = TextEditingController();
  
  final dbConnect = DBConnect(); // Initialize DBConnect

  // Function to add new question and store it in the database
  void _addFlashcardToDatabase() {
    
    final String quizname = _quizName.text;
    final String question = _questionController.text;
    final String answer = _answerController1.text;
    final String option2= _answerController2.text;
    final String option3 = _answerController3.text;
    final String option4   = _answerController4.text;
    final String id = idController.text;

    if (question.isNotEmpty && answer.isNotEmpty) {
      // Add the question to the Firebase database
      dbConnect.addQuestion(Questions(
        id: id,
        question: question,
        options: {answer: true, option2: false, option3:false, option4: false}
      ),quizname);

      // Clear input fields
      _quizName.clear();
      _questionController.clear();
      _answerController1.clear();
      _answerController2.clear();
      _answerController3.clear();
      _answerController4.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Generate Quiz',
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
        child: Card(
          color: Colors.black54,
          margin: const EdgeInsets.all(50),
          child: Container(
            width: double.infinity,
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _quizName,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(labelText: 'Enter Quiz Name' , labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    )),
                  ),
                  TextField(
                    controller: _questionController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(labelText: 'Enter Question',labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    )),
                  ),
                  TextField(
                    controller: _answerController1,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(labelText: 'Enter the correct Options',labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    )),
                  ),TextField(
                    controller: _answerController2,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(labelText: 'Enter wrong option1',labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    )),
                  ),TextField(
                    controller: _answerController3,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(labelText: 'Enter wrong option2',labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    )),
                  ),TextField(
                    controller: _answerController4,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(labelText: 'Enter wrong option three',labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    )),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _addFlashcardToDatabase,
                    child: Text('Add Question'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _quizName.dispose();
    _questionController.dispose();
    _answerController1.dispose();
    _answerController2.dispose();
    _answerController3.dispose();
    _answerController4.dispose();
    super.dispose();
  }
}


















// import 'package:flutter/material.dart';

// class AddQuestions extends StatefulWidget {
//   const AddQuestions({super.key});

//   @override
//   State<AddQuestions> createState() => _AddQuestionsState();
// }

// class _AddQuestionsState extends State<AddQuestions> {
//   final List<Flashcard> flashcards = [];
//   final _quizName = TextEditingController();
//   final _questionController = TextEditingController();
//   final _answerController = TextEditingController();

//   // Function to add new question
//   void _addFlashcard() {
//     final String question = _questionController.text;
//     final String answer = _answerController.text;
//     final String quiz = _quizName.text;

//     if (question.isNotEmpty && answer.isNotEmpty) {
//       setState(() {
//         flashcards.add(Flashcard(question: question, answer: answer));
//       });
//       _quizName.clear();
//       _questionController.clear();
//       _answerController.clear();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Generate Quiz',
//           style: TextStyle(
//               color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.black,
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage('lib/assets/images/bg.jpg'),
//                 fit: BoxFit.cover)),
//         child: Card(
//           color: Colors.black54,
//           margin: const EdgeInsets.all(50),
//           child: Container(
//             width: double.infinity,
//             padding:
//                 const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 children: [
//                    TextField(
//                     controller: _quizName,
//                     decoration: InputDecoration(labelText: 'Enter Quiz Name' , labelStyle: TextStyle(
//                       color: Colors.white,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold
//                     )),
//                   ),
//                   TextField(
//                     controller: _questionController,
//                     decoration: InputDecoration(labelText: 'Enter Question',labelStyle: TextStyle(
//                       color: Colors.white,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold
//                     )),
//                   ),
//                   TextField(
//                     controller: _answerController,
//                     decoration: InputDecoration(labelText: 'Enter Answer',labelStyle: TextStyle(
//                       color: Colors.white,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold
//                     )),
//                   ),
//                   SizedBox(height: 16),
//                   ElevatedButton(
//                     onPressed: _addFlashcard,
//                     child: Text('Add Flashcard'),
//                   ),
//                   Expanded(
//                     child: ListView.builder(
//                       itemCount: flashcards.length,
//                       itemBuilder: (context, index) {
//                         final flashcard = flashcards[index];
//                         return ListTile(
//                           title: Text(flashcard.question),
//                           subtitle: Text(flashcard.answer),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void dispose() {
//     _quizName.dispose();
//     _questionController.dispose();
//     _answerController.dispose();
//     super.dispose();
//   }
// }

// class Flashcard {
//   String question;
//   String answer;

//   Flashcard({required this.question, required this.answer});
// }
