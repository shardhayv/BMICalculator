import 'package:bmi_calculator/constants.dart';
import 'package:flutter/cupertino.dart';

class CardData extends StatelessWidget {
  const CardData(
      {super.key,
      required this.textColour,
      required this.iconColour,
      required this.iconName,
      required this.label});

  final Color textColour;
  final Color iconColour;
  final IconData iconName;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconName,
          size: 50,
          color: iconColour,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          label,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
