import 'question.dart';
class QuizeBrain {
  int _questionNumber = 0;
  List <Question> _questionSet = [
    Question(q:'abc',a: true),
    Question(q:'cde',a: true),
    Question(q:'efg',a: false),
    Question(q:'hij',a: false),
  ];
  void nextQuestion(){
    if (_questionNumber < _questionSet.length -1) {
      _questionNumber ++;
      
    }
  }
  String getQuestionText( ){
    return _questionSet[_questionNumber].questionText;
  }
  bool getQuestionAnswer( ){
    return _questionSet[_questionNumber].questionAnswer;
  }

}