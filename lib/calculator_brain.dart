import 'dart:math';
class CalculatorBrain{
  CalculatorBrain({this.weight,this.height});
  final int weight;
  final int height;
  double _bmi;

  String calculateBMI(){
    _bmi = weight/pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getRes(){
    if (_bmi >=25)
      return 'Overweight';
    else if (_bmi >=18.5)
      return 'Normal';
    else
      return 'Underweight';
  }

  String getInterpretation(){
    if (_bmi >=25)
      return 'You have a high body weight. Try to exercise more.';
    else if (_bmi >=18.5)
      return 'Amazing! You have a normal body weight.';
    else
      return 'You have a low body weight. Try to eat more.';
  }
}