import 'package:app02_quiz/data/questions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result(this.selectedAnswers,this.RestartQuiz, {super.key});
  final void Function() RestartQuiz;
final List<String> selectedAnswers;

List<Map<String, Object>> getSummmaryData(){
final List<Map<String, Object>> summaryData = [];
for (var i = 0; i < selectedAnswers.length; i++) {
  summaryData.add({
    'question_index': i,
    'question': questions[i].text,
    'correct_answer': questions[i].answers[0],
    'user_answer': selectedAnswers[i],
 
  });
  }
  return summaryData;
}

  @override
  Widget build(BuildContext context) {
    var numofCorrectAnswers = getSummmaryData().where((e) => e['user_answer'] == e['correct_answer']).length;

    return   Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: SizedBox(
        height: 500,
        child: SingleChildScrollView(
          child: Column(
            
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  
                  'You answered $numofCorrectAnswers out of ${questions.length} questions correctly',
                  style: TextStyle (
                    
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
          
                const Text('...'),
                const SizedBox(height: 20),
                ...getSummmaryData().map((e) => Column(
                  
                  children: [
          
                    Row(children: [
                    CircleAvatar(child:  Text(((e['question_index'] as int)+ 1 ).toString()),
                    radius: 16,
                    backgroundColor: Color.fromARGB(255, 203, 142, 12)
                    ),
                    const SizedBox(width: 10),
                     
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start ,
                      
                      children: [
                      Text(e['question'].toString(), 
                      
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 17, 2, 12)),
                      ),
                      Text(e['user_answer'].toString(), 
                      
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      backgroundColor: e['user_answer'] == e['correct_answer'] ? Colors.blue : Colors.red, 
                      ),), 
                      Text(e['correct_answer'].toString()),
                        SizedBox(height: 10),
                      ],
                      
                      
                    ),
                  ), 
                 
                  
                    ],), 
                    
                  ],
                )),
                TextButton.icon(onPressed: (){
                  RestartQuiz();
                },
                icon: Icon(Icons.restart_alt_rounded, size: 30, color: Colors.blue),
                 label: Text('Restart Quiz'), 
                style: TextButton.styleFrom(
                 
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
                ),
                
            
               
              ],  
            ),
        ),
      ),
    );
  
  }
}