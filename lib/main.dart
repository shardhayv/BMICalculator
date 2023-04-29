import 'package:bmi_calculator/results.dart';
import 'package:flutter/material.dart';

import 'input_page.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: const Color(0xff090C22),
          scaffoldBackgroundColor: const Color(0xff060A1A)),
      initialRoute: '/',
      routes: {
        '/': (context) => const InputPage(),
        '/results': (context) => const ResultPage(),
      },
    );
  }
}
