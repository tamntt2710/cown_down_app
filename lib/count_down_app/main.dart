
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:start_now/count_down_app/Model/food.dart';

import 'Component/buildButton.dart';
import 'Component/counter.dart';
import 'Component/menu.dart';
import 'Component/name_of_food.dart';
import 'Model/noti_food.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
void main() {
  runApp(
      ChangeNotifierProvider(
        create: (_)=> notiFood(),
        child: ScreenUtilInit(
          designSize: Size(360, 690),
          builder: () => MaterialApp(
            home: MyApp(),
          ),
        ),
      ));
}

class MyApp extends StatelessWidget {
  Food food = new Food(
      pathImage: 'asset/eggs.png',
      nameOfFood: "eggs",
      second: 180,);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(
                0.0, 1.0), // 10% of the width, so there are ten blinds.
            colors: <Color>[
              Color(0xFFFFFFFF),
              Color(0xFFDEAF3C)
            ], // red to yellow
            tileMode: TileMode.repeated, // repeats the gradient over the canvas
          ),
        ),
        child: Column(
          children: [
            Menu(),
            NameOfFood(
              food : food,
            ),

            Counter_Time(),
            SizedBox(height: 15,),
            Center(
                child : buildButton(context),
            )
            
            
          ],
        ),
      ),
    );
  }
}


Widget buildButton(BuildContext context){
  final isRunning = Provider.of<notiFood>(context).timer == null ? false :
      Provider.of<notiFood>(context).timer!.isActive;
  final isCompleted = Provider.of<notiFood>(context).seconds ==  notiFood.maxSecond
      || Provider.of<notiFood>(context).seconds == 0 ;
  return (isRunning || !isCompleted)
    ? Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ButtonWidget(
          text: isRunning ? "Pause" : "Resume",
          color: Color(0xFFA75050),
          backgroundColor: Colors.white ,
            onClicked: () {
           if(isRunning) {
             Provider.of<notiFood>(context, listen: false).stopTimer(reset:
             false);
           }else{
             Provider.of<notiFood>(context, listen: false).startTimer(reset:
             false);
           }
            }
        ),
        ButtonWidget(
            text: "Stop",
            color: Colors.white,
            backgroundColor: Color(0xFFA75050) ,
            onClicked: () {
              print("Stop");
              Provider.of<notiFood>(context,listen: false).startTimer();
            }
        ),
      ],
    )
      : ButtonWidget(
        text: "Start Timers",
        color: Colors.white,
        backgroundColor: Color(0xFFDF880B) ,
        onClicked: () {
          print("Start");
          Provider.of<notiFood>(context,listen: false).startTimer();
        },
  );
}
