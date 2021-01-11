import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final double percentage;
  final Function function;
  Button({this.text, this.percentage, this.function});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        width: MediaQuery.of(context).size.width * percentage,
        decoration: BoxDecoration(
          color: Color(0xff1077E5),
          borderRadius: BorderRadius.all(
            Radius.circular(23),
          ),
          boxShadow: [
            BoxShadow(color: Colors.grey, offset: Offset(1, 2), blurRadius: 3),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.height * 0.035,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

