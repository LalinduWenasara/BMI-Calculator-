import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'input_page.dart';
import 'reusabecardcopy.dart';
import 'reusable_card.dart';

class Resultpage extends StatelessWidget {
 Resultpage({required this.bmiResults,required this.interpretation,required this.resulttext});


  final String bmiResults;
  final String resulttext;
  final String interpretation;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              child: Container(
                  child: Center(
                    child: Text(
            'answers',
            style: kTitlesStyle,
          ),
                  ))),
          Expanded(
            flex: 4,
            child: ReusableCard2(
              colour: kinactivecardcolour1,
              cardChild: Container(
                  padding: EdgeInsets.all(18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      Center(
                        child: Text(
                          resulttext,
                          style: kresultTitlesStyle,
                        ),
                      ),
                      Center(
                        child: Text(
                          bmiResults,
                          style: knumberlTextStyle,
                        ),
                      ),
                      Center(
                        child: Text(
                          interpretation,
                          textAlign: TextAlign.center,
                          style: klabellTextStyle,
                        ),
                      ),
                    ],
                  )),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => InputPage()));
            },
            child: Container(
              color: kbottomContainerColour,
              width: double.infinity,
              height: kbottomContainerHeight,
              padding: EdgeInsets.only(bottom: 8),
              child: Center(
                  child: Text(
                'Re-Calculate',
                style: kCalTextStyle,
              )),
            ),
          ),
        ],
      ),
    );
  }
}
