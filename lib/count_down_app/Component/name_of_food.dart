import 'package:flutter/material.dart';
import 'package:start_now/count_down_app/Model/food.dart';
class NameOfFood extends StatelessWidget {
  Food food;
  NameOfFood({Key? key,required this.food}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int minutes = (food.second / 60).truncate();
    String minutesStr = (minutes % 60).toString();
     return Column(
      children: [
        Padding(
            padding: EdgeInsets.only(top: 10, left: 10),
            child: Center(
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Soft Boiled\n',
                        style: TextStyle(
                          fontWeight: FontWeight.bold, color: Color(
                            0xFFCD8A00), fontSize: 30,)),
                    TextSpan(text: '      eggs ',
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
              Icon(
                Icons.arrow_back_ios, color: Color(0xFFCD8A00), size: 43,),
              Container(
                alignment: Alignment.center,
                height: 180,
                width: 280,
                child: Image.asset(
                  '${food.pathImage}',
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_outlined, color: Color(0xFFCD8A00),
                size: 43,)
            ],
          ),

        ),
        SizedBox(height: 15,),
        Text('${minutesStr  + ' mimutes'}',
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


