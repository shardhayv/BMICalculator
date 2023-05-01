import 'package:bmi_calculator/components/button_page_view.dart';
import 'package:bmi_calculator/components/card_view.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {super.key,
      required this.bmiResult,
      required this.bmiNumber,
      required this.resultInterpretation});

  final String bmiResult;
  final String bmiNumber;
  final String resultInterpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            child: const Text(
              textAlign: TextAlign.center,
              "Your Result ",
              style: kTitleText,
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kBMICardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    bmiResult,
                    style: kResultText,
                  ),
                  Text(
                    bmiNumber,
                    style: kBMITextStyle,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    resultInterpretation,
                    style: kBMIBodyStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
