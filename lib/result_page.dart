import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusable_card.dart';
import 'bottom_button.dart';
class ResultsPage extends StatelessWidget {
  ResultsPage({@required this.bmiResult,@required this.interpretation,@required this.resText});
  final String bmiResult;
  final String resText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(child: Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Text('Your Result',style: titleTextStyle,),
          ),),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: activecardcolour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(resText.toUpperCase(),style: resultTextStyle,),
                  Text(bmiResult,style: BMITextStyle,),
                  Text(interpretation,style: bodyTextStyle, textAlign: TextAlign.center,),
                ],
              ),
            ),),
          BottomButton(buttonTitle: 'RECALCULATE',
          onTap: (){
            Navigator.pop(context);
          },)
        ],
      ),
    );
  }
}
