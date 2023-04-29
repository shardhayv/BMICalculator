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
                            const RoundCustomButton(
                              icon: Icons.add,
                            ),
                            // FloatingActionButton(
                            //   backgroundColor: const Color(0xff7776A4),
                            //   onPressed: () {},
                            //   child: const Icon(
                            //     Icons.add,
                            //   ),
                            // ),
                            const SizedBox(
                              width: 10,
                            ),
                            FloatingActionButton(
                              backgroundColor: const Color(0xff7776A4),
                              onPressed: () {},
                              child: const Icon(
                                Icons.add,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const Expanded(
                  child: ReusableCard(
                    colour: kCardColour,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            color: kBottomCOntainerColour,
            width: double.infinity,
            height: kBottomContainerHeight,
          )
        ],
      ),
    );
  }
}

class RoundCustomButton extends StatelessWidget {
  const RoundCustomButton({super.key, this.icon});

  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      constraints: const BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: const CircleBorder(),
      fillColor: const Color(0xff7776A4),
      onPressed: () {},
      child: Icon(icon),
    );
  }
}
