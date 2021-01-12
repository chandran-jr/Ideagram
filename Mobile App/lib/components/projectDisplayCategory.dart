import 'package:flutter/material.dart';

class ProjectCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFF1077E5),
          style: BorderStyle.solid,
          width: 2.0,
        ),
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(7.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "DIY",
              style: TextStyle(
                color: Color(0xFF1077E5),
                fontFamily: 'Roboto',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
          )
        ],
      ),
    );
  }
}
