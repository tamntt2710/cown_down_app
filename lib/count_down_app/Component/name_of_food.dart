import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:start_now/count_down_app/Component/parseTime.dart';
import 'package:start_now/count_down_app/Model/food.dart';
import 'package:start_now/count_down_app/Model/list_foods.dart';
class NameOfFood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ListFoods listFoods;
     return Column(
      children: [
        Padding(
            padding: EdgeInsets.only(top: 10, left: 10),
            child: Center(
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: Provider.of<ListFoods>(context).currentFood.nameOfFood,
                        style: TextStyle(
                          fontWeight: FontWeight.bold, color: Color(
                            0xFFCD8A00), fontSize: 30,)),
                  ],
                ),
              ),
            )
        ),
        Padding(
          padding: EdgeInsets.only(top: 20, left: 30),
          child: Row(
            children: [
              GestureDetector(
                child: Icon(
                  Icons.arrow_back_ios, color: Color(0xFFCD8A00), size: 43,),
                onTap: (){
                  if( Provider.of<ListFoods>(context,listen: false)
                      .selectedItem > 0){
                    Provider.of<ListFoods>(context,listen: false)
                        .selectedItem --;
                    print(Provider.of<ListFoods>(context,listen: false).selectedItem);
                    print(Provider.of<ListFoods>(context,listen: false)
                        .currentFood.nameOfFood);
                  }
                  Provider
                      .of<ListFoods>(context, listen: false).SelectedItem(Provider
                      .of<ListFoods>(context, listen: false)
                      .selectedItem --);
                },
              ),
              Container(
                alignment: Alignment.center,
                height: 180,
                width: 280,
                child: Image.asset(
                    '${Provider.of<ListFoods>(context).currentFood.pathImage}',
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
              GestureDetector(
                child: Icon(
                  Icons.arrow_forward_ios_outlined, color: Color(0xFFCD8A00),
                  size: 43,),
                onTap: (){
                if(Provider.of<ListFoods>(context,listen: false)
                    .selectedItem < Provider.of<ListFoods>(context,listen:
                false).listFood.length - 1) {
                  Provider
                      .of<ListFoods>(context, listen: false)
                      .selectedItem ++;
                  print(Provider
                      .of<ListFoods>(context, listen: false)
                      .selectedItem);
                  print(Provider
                      .of<ListFoods>(context, listen: false)
                      .currentFood
                      .nameOfFood);
                }
                Provider
                    .of<ListFoods>(context, listen: false).SelectedItem(Provider
                    .of<ListFoods>(context, listen: false)
                    .selectedItem++);
                },
              )
            ],
          ),

        ),
        SizedBox(height: 15,),
        Text(Provider.of<ListFoods>(context,listen: false).currentFood.second > 60
            ?'${intToTimeLeft(Provider.of<ListFoods>(context)
            .currentFood.second)  + ' mimutes'}'
            : '${intToTimeLeft(Provider.of<ListFoods>(context)
            .currentFood.second)  + ' mimute'}',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Color(0xFFAA4648),
                fontSize: 25
            )
        ),
        SizedBox(height: 15,),
      ],
    );
  }
}


