import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ideagram/components/textInputbox.dart';
import 'package:ideagram/components/button.dart';

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffA9DEF9),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
          ),
          backgroundColor: Color(0xff1077E5),
          title: Center(
            child: Text(
              'Ideagram',
              style: TextStyle(
                  color: Colors.white, fontSize: 30, fontFamily: 'Lobster'),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                TextInputBox(
                  text: 'Title*',
                  radius: 30,
                ),
                SizedBox(
                  height: 10,
                ),
                TextInputBox(
                  text: 'Name of the author*',
                  radius: 15,
                ),
                SizedBox(
                  height: 10,
                ),
                TextInputBox(
                  text: 'Email*',
                  radius: 15,
                ),
                SizedBox(
                  height: 10,
                ),
                TextInputBox(
                  text: 'About*(in 1 line)',
                  radius: 15,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  //height: 200,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    reverse: true,
                    child: TextInputBox(
                      text: 'Description',
                      radius: 15,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextInputBox(
                  text: 'Links(GitHub, YouTube etc)',
                  radius: 15,
                ),
                SizedBox(
                  height: 10,
                ),
                TextInputBox(
                  text: 'Category*(DIY, IoT etc)',
                  radius: 15,
                ),
                SizedBox(
                  height: 10,
                ),
                Button(
                  text: 'Upload Image',
                  percentage: 0.39,
                ),
                SizedBox(
                  height: 10,
                ),
                Button(
                  text: 'SAVE',
                  percentage: 0.49,
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
