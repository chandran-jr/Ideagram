// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ideagram_v2/screens/project_list_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String id = "/";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    final t = MediaQuery.of(context).textScaleFactor;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: w,
          height: h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/landing_mob.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            width: w,
            height: h,
            color: Color(0xff00254E).withOpacity(0.8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: h * 0.05,
                ),
                Text(
                  'Ideagram',
                  style: TextStyle(
                    fontSize: t * 90,
                    fontFamily: 'LobsterTwo',
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: h * 0.05,
                ),
                Text(
                  'A home for your ideas',
                  style: TextStyle(
                    fontFamily: 'LobsterTwo',
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: t * 37,
                  ),
                ),
                SizedBox(
                  height: h * 0.06,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    // backgroundColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.white,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          8,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      ProjectListScreen.id,
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 3,
                      horizontal: 8.0,
                    ),
                    child: Text(
                      'Go to Projects',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: t * 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
