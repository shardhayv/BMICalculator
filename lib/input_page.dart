import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'card_view.dart';
import 'icon_view.dart';

const bottomContainerHeight = 80.0;
const cardColour = Color.fromARGB(255, 37, 51, 210);
const activeCardCOlour = Colors.yellow;
const bottomCOntainerColour = Color(0xffEA1556);
const iconColour = Color(0xffFFFFFF);
const textColour = Color(0xffFFFFFF);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  // Color maleCardColour = cardColour;
  // Color femaleCardColour = cardColour;

  // void updateCardColour(Gender gender) {
  //   // 1 mans male card pressed
  //   if (gender == Gender.male) {
  //     if (maleCardColour == cardColour) {
  //       maleCardColour = activeCardCOlour;
  //       femaleCardColour = cardColour;
  //     } else {
  //       maleCardColour = cardColour;
  //     }
  //   }
  //   if (gender == Gender.female) {
  //     if (femaleCardColour == cardColour) {
  //       femaleCardColour = activeCardCOlour;
  //       maleCardColour = cardColour;
  //     } else {
  //       femaleCardColour = cardColour;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: selectedGender == Gender.male
                        ? activeCardCOlour
                        : cardColour,
                    onPressed: () {
                      setState(
                        () {
                          selectedGender == Gender.male;
                          print('Male clicked');
                        },
                      );
                    },
                    cardChild: const CardData(
                      textColour: iconColour,
                      iconColour: textColour,
                      iconName: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPressed: () {
                      setState(() {
                        selectedGender == Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? activeCardCOlour
                        : cardColour,
                    cardChild: const CardData(
                      textColour: iconColour,
                      iconColour: textColour,
                      iconName: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              onPressed: () {},
              colour: cardColour,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPressed: () {},
                    colour: cardColour,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPressed: () {},
                    colour: cardColour,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            color: bottomCOntainerColour,
            width: double.infinity,
            height: bottomContainerHeight,
          )
        ],
      ),
    );
  }
}
