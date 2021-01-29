import 'package:flutter/material.dart';
import 'quizebrain.dart';
QuizeBrain quizeBrain = QuizeBrain();

void main() {
  runApp(
    Quizzer()
    );
}

class Quizzer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Well Come To Quizer',
          style: TextStyle(
            color: Colors.white,            
          ),
          ),
          backgroundColor: Colors.teal,
        ),
        body: QuizePage(),
      ),
      
    );
  }
}
class QuizePage extends StatefulWidget {
  @override
  _QuizePageState createState() => _QuizePageState();
}

class _QuizePageState extends State<QuizePage> {
  List<Icon> scoreKepper = [];
  void checkAnswer(bool userPickedAnswer){
    bool correctAnswer = quizeBrain.getQuestionAnswer();
                if (userPickedAnswer == correctAnswer) {
                  scoreKepper.add(Icon(
                    Icons.check,
                    color: Colors.green
                    ));
                } else {
                  scoreKepper.add(Icon(
                    Icons.close,
                    color: Colors.red
                  ));
                }
    setState(() {
                  quizeBrain.nextQuestion();
                  
                 });
  }
  //List<String> questions =[ 'abc','ced','efg','ghi'];
  //List<bool> answers = [ true,  false,   true,  true ];
  

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              quizeBrain.getQuestionText(),
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
            ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FlatButton(              
              color: Colors.green,
              child: Text('True',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),

              ),
              onPressed: (){
                // The user picked True Button
                checkAnswer(true);
                
                


              },
              ),
          ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FlatButton(
                color: Colors.red,
                child: Text('False',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
                ),
                onPressed: (){
                  checkAnswer(false);
                },
              ),
            ),
          ), 
          // for score keeper
          Row(
            children: scoreKepper,
          ),
       
        
      ],
      
    );
  }
}