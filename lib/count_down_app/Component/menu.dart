import 'package:flutter/material.dart';
class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(left: 10, top: 20),
      child: Icon(Icons.menu, color: Color(0xFFCD8A00), size: 43,),
    );
  }
}
