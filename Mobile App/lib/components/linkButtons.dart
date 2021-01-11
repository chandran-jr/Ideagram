import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkButton extends StatelessWidget {
  final String text;
  final double percentage;

  LinkButton({this.text, this.percentage});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchURL,
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
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.height * 0.025,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
      ),
    );
  }

  _launchURL() async {
    const url = 'https://github.com/AshNiz24/DSCWOW-SmartSpark';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
