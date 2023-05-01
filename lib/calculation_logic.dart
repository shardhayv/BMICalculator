import 'dart:math';

class CalculatorLogic {
  CalculatorLogic({
    required this.height,
    required this.weight,
  });

  final int height;
  final int weight;

  final double _bmi = 0.0;

  String calculateBMI() {
    double bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Your weight is higher than the normal weight, You need to exercise';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight , Good Job!';
    } else {
      return 'Your weight is lower than the normal weight, You need to eat more';
    }
  }
}
