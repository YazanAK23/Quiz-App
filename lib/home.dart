// import 'dart:math';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final void Function() switchscreen;

  const Home(this.switchscreen, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 200,
            height: 200,
            color: Colors.amber,
          ),
          const SizedBox(height: 50),
          const Text(
            'Let\'s play Quiz!',
            style: TextStyle(fontSize: 30, color: Color.fromRGBO(255, 0, 0, 0.8)),
          ),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.black45,
            ),
            onPressed: switchscreen,
            icon: Icon(Icons.arrow_right),
            label: const Text(
              'Start Quiz',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
