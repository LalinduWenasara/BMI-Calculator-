import 'dart:math';

class Calculation_Bmi {
  Calculation_Bmi({required this.height, required this.weight});

  final int height;
  final int weight;
  late double _bmi= weight / pow(height / 100, 2);

  String calbmi() {
    return _bmi.toStringAsFixed(1);
  }

  String getResults() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }


  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have higher body weight than normal try to diet and exercise more ';
    } else if (_bmi > 18.5) {
      return 'Keep up the good work! You have a good body weight';
    } else {
      return 'you re not eating enough or you';
    }
  }



}
