// ignore_for_file: file_names

class Questions {
  final String id;
  final String question;
  final Map<String, bool> options;

  Questions({required this.id, required this.question, required this.options});

  @override
  String toString() {
    return 'Questions(id: $id, question: $question, options: $options)';
  }
}