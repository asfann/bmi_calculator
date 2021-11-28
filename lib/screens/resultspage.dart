import 'package:bmi_calculator/components/bottom_button.dart';
import 'input_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusable_code.dart';
import 'package:bmi_calculator/calculator_brain.dart';

class Resultpage extends StatelessWidget {

  Resultpage({@required this.bmiResult, @required this.resultText, @required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String  interpretation;
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
          alignment: Alignment.bottomLeft,
          child: Text('Your Result',
          style: kTitleStyle,),
      ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kWidgetColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(resultText.toUpperCase(),style: kWeight,),
                  Text(bmiResult,
                  style: kResult,),
                  Text(interpretation,
                    textAlign: TextAlign.center,
                    style: kText,)
                ],
              ),
            ),
          ),
          CalculateButton(onTap: (){
            Navigator.pop(context);
          }, buttonTitle: 'RE_CALCULATE')
        ],
      ),
    );
  }
}
