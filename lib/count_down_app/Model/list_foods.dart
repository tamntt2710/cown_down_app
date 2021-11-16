import 'package:flutter/material.dart';
import 'package:start_now/count_down_app/common/constant.dart';

import 'food.dart';
class ListFoods extends ChangeNotifier{
  int selectedItem = 0;
  Color colorSelect = kPrimaryColor;
  final List<Food> listFood = [
    Food(
        index :1 ,
        color: kPrimaryColor,
        pathImage: 'asset/eggs.png',
        nameOfFood: "Soft Boiled eggs",
        second: 180,),
    Food(
        index : 2 ,
        color: Color(0xFF95056),
        pathImage: 'asset/bread.png',
        nameOfFood: "Hot smell cake",
        second: 150,),
    Food(
        index : 3 ,
        color: Color(0xFFFFFFFF),
        pathImage: 'asset/fried_egg.png',
        nameOfFood: "Hot crispy omelet ",
        second: 200,),
    Food(
        index : 4 ,
        color: Color(0xFF046401),
        pathImage: 'asset/vegettable.png',
        nameOfFood: "Hot green vegetable ",
        second: 600,),
    Food(
        index : 5 ,
        color: Color(0xFFDBCC42),
        pathImage: 'asset/noodle.png',
        nameOfFood: "Hot noodle",
        second: 200,),
  ];

  Food get currentFood => listFood[selectedItem];
  void SelectedItem(int index){
    selectedItem = index;
    colorSelect = listFood[index].color;
    notifyListeners();
  }

}