import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class notiFood extends ChangeNotifier{


  static const maxSecond = 180;
  int seconds = maxSecond;
  Timer? timer;
 void startTimer({bool reset = true}){
  // int seconds= food.second;
   if(reset){
     resetTimer();
   }
   timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
    // food.second --;
     if(seconds > 0) {
       seconds --;
       notifyListeners();
     }
     else
       stopTimer(reset : false);
    });
    notifyListeners();
  }
  void resetTimer(){
   print("Reset time");
   seconds = maxSecond;
   notifyListeners();
 }
  void stopTimer({reset = true}) {
    if (reset) {
      print("Reset after stop");
      resetTimer();
    }else {
      print("Cancel/Stop after stop");
      timer?.cancel();
    }
    notifyListeners();
  }
}