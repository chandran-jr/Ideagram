import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ideagram/components/projectDisplayCategory.dart';
import 'package:ideagram/components/linkButtons.dart';
import 'package:url_launcher/url_launcher.dart';

class DisplayProject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                color: Colors.white,
                fontSize: 30,
                fontFamily: 'Lobster',
              ),
            ),
          ),
        ),
        backgroundColor: Color(0xffF5FCFF),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(15),
          scrollDirection: Axis.vertical,
          child: Flexible(
            child: Column(
              children: <Widget>[
                Center(
                  child: Text(
                    'SMART SPARK',
                    style: TextStyle(
                      fontSize: 30,
                      shadows: [
                        Shadow(
                            color: Colors.grey,
                            offset: Offset(0, 4),
                            blurRadius: 4),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ProjectCategory(),
                    Text(
                      '--by Author',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.27,
                    width: MediaQuery.of(context).size.width * 0.71,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://raw.githubusercontent.com/AshNiz24/DSCWOW-SmartSpark/main/pics/hardware.jpeg'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.all(
                        Radius.circular(17),
                      ),
                      border: Border.all(
                        width: 1,
                        style: BorderStyle.solid,
                        color: Color(0xff1077E5),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'An energy monitoring project that sends data from sensors to cloud database. Uses PZEM sensor to send sensor data via nodemcu to firestore. Google sheets acts as a server. Has a mobile app by which users can see their energy bills',
                  style: TextStyle(fontSize: 16, fontFamily: 'Roboto'),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    'Links',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff1077E5),
                      fontFamily: 'Lobster',
                      fontSize: 26,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                LinkButton(
                  text: 'https://github.com/AshNiz24/DSCWOW-SmartSpark',
                  percentage: 0.76,
                ),
                SizedBox(
                  height: 18,
                ),
                Center(
                  child: Text(
                    'Connect with me at 👇🏼',
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: RaisedButton(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    onPressed: () => mail('techbeestvm@gmail.com'),
                    color: Color(0xff1077E5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.mail_outline,
                          color: Color(0xffFFFDFD),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          'techbeestvm@gmail.com',
                          style: TextStyle(
                              color: Color(0xffFFFDFD),
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold),
                        ),
                      ],
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

  mail(String toMail) async {
    var url = 'mailto:$toMail';
    if (await canLaunch(url))
      await launch(url);
    else
      throw 'Could not launch $url';
  }
}
