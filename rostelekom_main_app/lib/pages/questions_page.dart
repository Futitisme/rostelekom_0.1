import 'package:flutter/material.dart';

class QuestionsPage extends StatelessWidget {
  const QuestionsPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Вопросы?'),
          centerTitle: true,
          backgroundColor: Colors.orange[600],
        ),
      );
}
