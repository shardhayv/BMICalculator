import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'card_view.dart';
import 'constants.dart';
import 'icon_view.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;

  int height = 180;
  int weight = 50;
  int age = 20;
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: ReusableCard(
                      cardChild: const CardData(
                        textColour: kIconColour,
                        iconColour: kTextColour,
                        iconName: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                      colour: selectedGender == Gender.male
                          ? kActiveCardCOlour
                          : kCardColour,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: ReusableCard(
                      cardChild: const CardData(
                        textColour: kIconColour,
                        iconColour: kTextColour,
                        iconName: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                      colour: selectedGender == Gender.female
                          ? kActiveCardCOlour
                          : kCardColour,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberLabelStyle,
                      ),
                      const Text('cm', style: kLabelTextStyle),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: kActiveTrackColour,
                        thumbColor: kThumbColour,
                        overlayColor: kOverlayColour,
                        inactiveTrackColor: kInactiveTrackColour,
                        thumbShape:
                            const RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 30)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,

                      // activeColor: Colors.amber,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kCardColour,
                    cardChild: Column(
                      children: [
                        const Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberLabelStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundCustomButton(
                              function: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            RoundCustomButton(
                              function: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kCardColour,
                    cardChild: Column(
                      children: [
                        const Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberLabelStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundCustomButton(
                              function: () {
                                setState(() {
                                  age--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            RoundCustomButton(
                              function: () {
                                setState(() {
                                  age++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/results');
            },
            child: Container(
              margin: const EdgeInsets.only(top: 10.0),
              color: kBottomCOntainerColour,
              width: double.infinity,
              height: kBottomContainerHeight,
              child: const Text(
                'CALCULATE',
                style: kNumberLabelStyle,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RoundCustomButton extends StatelessWidget {
  RoundCustomButton({super.key, this.icon, required this.function});

  final IconData? icon;
  void Function() function;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      constraints: const BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      fillColor: const Color(0xff7776A4),
      onPressed: function,
      child: Icon(icon),
    );
  }
}
