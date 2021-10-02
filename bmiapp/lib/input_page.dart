import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'calculatorbmi.dart';
import 'reusable_card.dart';
import 'icon_contents.dart';
import 'reusabecardcopy.dart';
import 'constants.dart';
import 'result_page.dart';

enum Gender { female, male }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 50;
  int age = 20;
  /*
  Color malecardcolor = inactivecardcolour1;
  Color femalecardcolor = inactivecardcolour1;

  void updateColour(Gender selectedgen) {
    if (selectedgen == Gender.male) {
      if (malecardcolor == inactivecardcolour1) {
        malecardcolor = activatedcardcolour1;
        femalecardcolor = inactivecardcolour1;
      } else {
        malecardcolor = inactivecardcolour1;
        femalecardcolor = activatedcardcolour1;
      }
    }
    if (selectedgen == Gender.female) {
      if (femalecardcolor == inactivecardcolour1) {
        femalecardcolor = activatedcardcolour1;
        malecardcolor = inactivecardcolour1;
      } else {
        femalecardcolor = inactivecardcolour1;
        malecardcolor = activatedcardcolour1;
      }
    }
  }
*/
  var selectedGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(

                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kactivatedcardcolour1
                        : kinactivecardcolour1,
                    cardChild:
                        insidecont(textt: 'MALE', icon: FontAwesomeIcons.mars),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kactivatedcardcolour1
                        : kinactivecardcolour1,
                    cardChild: insidecont(
                        textt: 'FEMALE', icon: FontAwesomeIcons.venus),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard2(
              colour: kinactivecardcolour1,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Height',style: klabellTextStyle,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: knumberlTextStyle),
                      Text('cm',style: TextStyle(color: Colors.white.withOpacity(0.8)),),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      activeColor:  Color(0xff517b65),
                      inactiveColor: Colors.white,
                      onChanged: (double newvalue) {
                        print(newvalue);
                        setState(() {
                          height = newvalue.toInt();
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
                  child: ReusableCard2(
                    colour:  Color(0xffab9b81),
                    cardChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Weight',style: klabellTextStyle,),
                        Text(weight.toString(), style: knumberlTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon1: FontAwesomeIcons.minus,
                              func: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width/20,
                            ),
                            RoundIconButton(
                              func: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              icon1: FontAwesomeIcons.plus,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard2(
                    colour:  Color(0xffab9b81),
                    cardChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Age',style: klabellTextStyle,),
                        Text(age.toString(), style: knumberlTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon1: FontAwesomeIcons.minus,
                              func: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width/20,
                            ),
                            RoundIconButton(
                              func: () {
                                setState(() {
                                  age++;
                                });
                              },
                              icon1: FontAwesomeIcons.plus,
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
          GestureDetector(
            onTap: (){

              Calculation_Bmi calc= Calculation_Bmi(height:weight,weight:height);

              Navigator.push(context, MaterialPageRoute(builder:(context) => Resultpage(bmiResults:calc.getResults(),interpretation:calc.getInterpretation(),resulttext:calc.calbmi())));
            },
            child: Container(

              color: kbottomContainerColour,
              width: double.infinity,
              height: kbottomContainerHeight,
              padding: EdgeInsets.only(bottom: 8),
              child: Center(child: Text('CALCULATE',style: kCalTextStyle,)),
            ),
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon1, required this.func});
  final IconData icon1;
  final VoidCallback func;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: func,
      child: Icon(icon1),
      elevation: 6.0,
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(width: 60.0, height: 60.0),
      fillColor: Colors.lightBlueAccent,
      splashColor: Colors.pink,
    );
  }
}
