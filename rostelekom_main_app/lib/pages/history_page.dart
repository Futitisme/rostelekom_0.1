import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('История'),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(255, 79, 18, 1),
        ),
        body: Center(
            child: Lottie.network(
                'https://assets1.lottiefiles.com/packages/lf20_mkcnkz8c.json')),
      );
}
