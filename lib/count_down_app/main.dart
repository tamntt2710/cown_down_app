
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
import 'Model/list_foods.dart';
import 'common/constant.dart';
void main() {
  runApp(CounterApp());
}
class CounterApp extends StatelessWidget {
  CounterApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (contex)=> ListFoods()),
          ChangeNotifierProxyProvider<ListFoods,notiFood>(
              create: (context) => notiFood(maxSecond: 0),
              update: (context,listfood,notifood){
                return notiFood(maxSecond: listfood.currentFood.second);
              },
          )
        //  ChangeNotifierProvider(create: (_)=> notiFood(maxSecond: 180)),
          ],
        child: Consumer<ListFoods>(
          builder: (context,listfood,_){
            return ScreenUtilInit(
              designSize: Size(360, 690),
              builder: () => MaterialApp(
                theme: ThemeData(
                  iconTheme: IconThemeData(color: Provider.of<ListFoods>
                    (context,listen: false).currentFood.color),
                ),
                home: MyApp(),
              ),
            );
          },
    ),
    );
  }
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(
                0.0, 1.0), // 10% of the width, so there are ten blinds.
            colors: <Color>[

              Colors.white,
              Provider.of<ListFoods>(context,listen: false).colorSelect,
            ], // red to yellow
            tileMode: TileMode.repeated, // repeats the gradient over the canvas
          ),
        ),
        child: Column(
          children: [
            // Drawer(
            //   child: Icon(Icons.menu, color: Color(0xFFCD8A00), size: 43,),
            // ),
            Menu(),
            NameOfFood(),
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
  final isCompleted = Provider.of<notiFood>(context).second == Provider
      .of<ListFoods>(context).currentFood.second
      || Provider.of<notiFood>(context).second == 0 ;
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
             print(Provider.of<ListFoods>(context,listen: false).currentFood
                 .index);
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
