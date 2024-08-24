import 'dart:developer' as dv;
import 'package:app02_quiz/data/questions.dart';
import 'package:app02_quiz/home.dart';
import 'package:app02_quiz/question.dart';
import 'package:app02_quiz/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? activScreen;
  List<String> selectedAnswers = [];
  void ChooseAnswer(String answer) {
    dv.log('Answer: $answer');
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
      dv.log(selectedAnswers.toString()); 
        activScreen = Result(selectedAnswers, RestartQuiz);
        selectedAnswers = [];
      });
      dv.log('All questions answered');

    }
  }

  void RestartQuiz() {
    setState(() {
      selectedAnswers = [];
      activScreen = Home(switchscreen);
    });
  }
  
  @override
  void initState() {
    super.initState();
    activScreen = Home(switchscreen);
  }

 void switchscreen(){
    setState(() {
      activScreen = Questions(onSelectedAnswer: ChooseAnswer);
    });
  }
  
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        home: Scaffold(
          body: activScreen,
        ),
      );
    }
 }
 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body : Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.deepPurple,
              Colors.purple, 

            ])
          ),
          // child: Questions(ChooseAnswer),
          ),
      )
      ,
    );
  }

