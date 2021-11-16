import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class notiFood extends ChangeNotifier{
  int maxSecond;
  int second;
  notiFood({
    required this.maxSecond
  }):second = maxSecond;

  Timer? timer;
 void startTimer({bool reset = true}){
   if(reset){
     resetTimer();
   }
   timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
     if(second > 0) {
       second --;
       print(second);
       notifyListeners();
     }
     else
       stopTimer(reset : false);
    });
    notifyListeners();
  }
  void resetTimer(){
   print("Reset time");
   second = maxSecond;
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