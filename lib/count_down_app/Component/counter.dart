import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:start_now/count_down_app/Model/noti_food.dart';
class Counter_Time extends StatelessWidget {
  const Counter_Time({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String intToTimeLeft(int value) {
      int m, s;
      m = value  ~/ 60;

      s = value - (m * 60);

      String result = "$m:$s";

      return result;
    }
    return  Container(
      height: 200,
      width: 200,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child:  CircularProgressIndicator(
                value: Provider.of<notiFood>(context).seconds/notiFood.maxSecond,
                strokeWidth: 7,
                valueColor: AlwaysStoppedAnimation(Color(0xFFCD8A00)),
                backgroundColor: Color(0xFFF880B),
              ),

            ),
          ),
          Center(
            child :  Provider.of<notiFood>(context).seconds > 0 ?
            new Text(
              intToTimeLeft(Provider.of<notiFood>(context).seconds),
              style:TextStyle(color: Color(0xFFDE8400),fontSize: 30),
            )
            : Icon(
              Icons.done,color:Color(0xFFDE8400),size: 120,
            )
          ),

        ],
      ),

    );
  }
}
