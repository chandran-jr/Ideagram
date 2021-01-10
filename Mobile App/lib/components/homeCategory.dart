import 'package:flutter/material.dart';

class HomeCategoryBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
      decoration: BoxDecoration(
        color: Color(0xff1077E5),
        borderRadius: BorderRadius.all(
          Radius.circular(27),
        ),
      ),
      child: Center(
        child: Text(
          'DIY',
          style: TextStyle(
            color: Color(0xffF5FCFF),
          ),
        ),
      ),
    );
  }
}
