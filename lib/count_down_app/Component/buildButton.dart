import 'package:flutter/material.dart';
class ButtonWidget extends StatelessWidget{
  final String text;
  final Color color;
  final Color backgroundColor;
  final VoidCallback onClicked;
  ButtonWidget({
    Key? key,
    required this.text,
    required this.color,
    required this.backgroundColor,
    required this.onClicked
}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   return ElevatedButton(
     style: ElevatedButton.styleFrom(
       primary: backgroundColor,
       padding: EdgeInsets.symmetric(horizontal: 32,vertical : 16)
     ),
     child: Text(
       text,
       style: TextStyle(fontSize: 20,color: color),
     ),
    onPressed: onClicked,
   );
  }

}