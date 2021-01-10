import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ideagram/screens/inputscreen.dart';
import 'package:ideagram/components/cardtile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffA9DEF9),
        appBar: AppBar(
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
                color: Colors.white,
                fontSize: 30,
                fontFamily: 'Lobster',
              ),
            ),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.all(10),
          children: <Widget>[
            ProjectTiles(),
            SizedBox(
              height: 10,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return InputScreen();
                },
              ),
            );
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 38,
          ),
          backgroundColor: Color(0xff1077E5),
        ),
      ),
    );
  }
}
