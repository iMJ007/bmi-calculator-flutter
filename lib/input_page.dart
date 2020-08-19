import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';

enum Gender { male, female, other }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            // similar to using weights in linear layout with flex attr is weight
            child: Row(
              children: [
                Expanded(
                  child: ReusableWidget(
                    onClicked: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    color: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContentWidget(
                      icon: FontAwesomeIcons.mars,
                      title: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableWidget(
                    onClicked: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    color: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContentWidget(
                      icon: FontAwesomeIcons.venus,
                      title: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableWidget(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kLargeTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: kThumbColor,
                      thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15,
                          disabledThumbRadius: 10,
                          elevation: 4.0,
                          pressedElevation: 12),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: kInactiveTrackColor,
                      overlayColor: kThumbOverlayColor,
                      trackHeight: 1,
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: kMinHeight,
                      max: kMaxHeight,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.toInt();
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
                  child: ReusableWidget(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kLargeTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IncrementDecrementIconButton(
                              icon: FontAwesomeIcons.minus,
                              borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(16),
                              ),
                              onClicked: (){
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            IncrementDecrementIconButton(
                              icon: FontAwesomeIcons.plus,
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(16),
                              ),
                              onClicked: (){
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableWidget(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kLargeTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IncrementDecrementIconButton(
                              icon: FontAwesomeIcons.minus,
                              borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(16),
                              ),
                              onClicked: (){
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            IncrementDecrementIconButton(
                              icon: FontAwesomeIcons.plus,
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(16),
                              ),
                              onClicked: (){
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: kBottomContainerColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: kBottomContainerHeight,
          ),
        ],
      ),
    );
  }
}

class IncrementDecrementIconButton extends StatelessWidget {
  IncrementDecrementIconButton({@required this.icon, this.borderRadius, @required this.onClicked});

  final IconData icon;
  final BorderRadius borderRadius;
  final Function onClicked;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onClicked,
      elevation: 6,
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
      shape: BeveledRectangleBorder(borderRadius: borderRadius),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
