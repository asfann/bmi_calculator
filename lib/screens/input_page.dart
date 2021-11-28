import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_code.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/resultspage.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/roundiconbutton.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender{
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
 }

class _InputPageState extends State<InputPage> {

 Gender selectedGender;
 int height = 180;
 int weight = 60;
 int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: <Widget>[
          Expanded(child: Row(
          children: <Widget>[
            Expanded(
              child: ReusableCard(func:(){
                setState(() {
                  selectedGender = Gender.male;
                });
              }, colour: selectedGender == Gender.male ? kWidgetColour : kInwidgetColour,
            cardChild: ReusableGender(icon: FontAwesomeIcons.mars,gender: 'MALE',),),),
            Expanded(child: ReusableCard(func:() {
              setState(() {
                selectedGender = Gender.female;
            });}, colour: selectedGender == Gender.female ? kWidgetColour : kInwidgetColour,
            cardChild: ReusableGender(icon: FontAwesomeIcons.venus,gender: 'FEMALE',),))
          ],
          )),
          Expanded(child: ReusableCard(colour: kWidgetColour,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('HEIGHT',style: kLabel,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(height.toString(),style: kNumberstyle),
                    Text('cm',style: kLabel,)
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor: Color(0xFF8D8E98),
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xFFEB1555),
                    overlayColor:  Color(0x29EB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)
                  ),
                  child: Slider(value: height.toDouble(),
                      min: 120.0,
                      max: 200.0,
                      onChanged: (double newValue) {
                    setState(() {
                      height = newValue.round();
                    });
                      }),
                )
              ],
            ),),),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child:ReusableCard(colour: kWidgetColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Weight',
                    style: kLabel,
                  ),
                  Text(weight.toString(),
                  style: kNumberstyle,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                    RoundIconButton(
                      icon: FontAwesomeIcons.minus,
                      onPressed: () {
                        setState(() {

                        weight--;

                        });
                      },
                    ),
                      SizedBox(width: 10.0,),
                      RoundIconButton(
                        icon: FontAwesomeIcons.plus,
                        onPressed: () {
                          setState(() {

                            weight++;

                          });
                        },
                      ),],
                  ),
                ],
              ),)),
              Expanded(child: ReusableCard(colour: kWidgetColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Age',
                    style: kLabel,
                  ),
                  Text(age.toString(),
                    style: kNumberstyle,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RoundIconButton(
                        icon: FontAwesomeIcons.minus,
                        onPressed: () {
                          setState(() {

                            age--;

                          });
                        },
                      ),
                      SizedBox(width: 10.0,),
                      RoundIconButton(
                        icon: FontAwesomeIcons.plus,
                        onPressed: () {
                          setState(() {

                            age++;

                          });
                        },
                      ),],
                  ),
                ],
              ),))
            ],
          )),
          CalculateButton(buttonTitle: 'CALCULATE', onTap: () {

            CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);



    Navigator.push(context, MaterialPageRoute(builder: (context) => Resultpage(
      bmiResult:  calc.calculateBMI(),
      resultText: calc.getResult(),
      interpretation: calc.getInterpretation(),
    )));
    },
          )
        ],
      )
    );
  }
}
