import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'result_page.dart';
import 'bottom_button.dart';
import 'roundicon_button.dart';
import 'calculator_brain.dart';

enum Gender{male,female,}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedgender;
  int height=180;
  int weight=60;
  int age=19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI CALCULATOR'),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(
                onPress: (){
                  setState(() {
                    selectedgender=Gender.male;
                  });
                },
                colour: selectedgender==Gender.male ? activecardcolour:inactivecardcolour,
                cardChild: IconContent(icon: FontAwesomeIcons.mars,label: 'MALE',),
              ),),
              Expanded(
                child: ReusableCard(
                  onPress: (){
                    setState(() {
                      selectedgender=Gender.female;
                    });
                  },
                  colour: selectedgender==Gender.female ? activecardcolour:inactivecardcolour,
              cardChild: IconContent(icon: FontAwesomeIcons.venus,label: 'FEMALE',),
              ),),
            ],),),
          Expanded(child: ReusableCard(
            colour: activecardcolour,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('HEIGHT',style: labelTextStyle,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(height.toString(),style: numTextStyle),
                    Text('cm',style: labelTextStyle,),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor: Color(0xFF8D8E98),
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x29EB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,max: 220.0,
                    onChanged: (double newval){
                      setState(() {
                        height= newval.round();
                      });
                    },),
                )
              ],
            ),
          ),),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(
                colour: activecardcolour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('WEIGHT',style:labelTextStyle,),
                    Text(weight.toString(),style: numTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: (){
                            setState(() {
                              weight--;
                            });
                          },
                        ),
                        SizedBox(width: 10.0,),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed:(){
                            setState(() {
                              weight++;
                            });
                          },
                        ),
                      ],
                    ),
                  ],),),),
              Expanded(child: ReusableCard(
                colour: activecardcolour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('AGE',style: labelTextStyle,),
                    Text(age.toString(),style: numTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: (){
                            setState(() {
                              age--;
                            });
                          },
                        ),
                        SizedBox(width: 10.0,),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: (){
                            setState(() {
                              age++;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),),
            ],),),
          BottomButton(buttonTitle: 'CALCULATE',onTap:(){
            CalculatorBrain calc = CalculatorBrain(height: height,weight: weight);

            Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(
              bmiResult: calc.calculateBMI(), resText: calc.getRes(), interpretation: calc.getInterpretation(),
            )));
          },),
        ],
      ),
    );
  }
}
