// ignore_for_file: prefer_const_constructors, avoid_function_literals_in_foreach_calls, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../constants.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDisplayScreen extends StatelessWidget {
  final String title;
  final String author;
  final String email;
  final String about;
  final String desc;
  final String categories;
  final String links;
  final String imgPath;

  // static const String id = "/projectDisplay";
  const ProjectDisplayScreen({
    Key? key,
    required this.title,
    required this.author,
    required this.email,
    required this.about,
    required this.desc,
    required this.categories,
    required this.links,
    required this.imgPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    final t = MediaQuery.of(context).textScaleFactor;
    List categ = categories.split(',');
    List<CategoryChip> categoryChips = [];
    categ.forEach((element) {
      categoryChips.add(CategoryChip(category: element));
    });
    List link = links.split(',');
    List<LinkChips> linkChips = [];
    link.forEach((element) {
      linkChips.add(
        LinkChips(link: element),
      );
    });

    return SafeArea(
      child: Scaffold(
        backgroundColor: kLight,
        appBar: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(
              t * 10,
            ),
            bottomRight: Radius.circular(
              t * 10,
            ),
          )),
          // automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: kDark,
          title: kText,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: h * 0.02,
              ),
              Text(
                title.toUpperCase(),
                softWrap: true,
                style: TextStyle(
                  color: kDark,
                  fontSize: t * 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: h * 0.01,
              ),
              Container(
                width: w * 0.9,
                // color: Colors.yellow,
                child: Row(
                  children: [
                    Wrap(
                      spacing: 4,
                      runSpacing: 4,
                      children: categoryChips,
                    ),
                    Spacer(),
                    Text(
                      'By $author',
                      style: TextStyle(
                        color: kDark,
                        fontWeight: FontWeight.w500,
                        fontSize: t * 15,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: h * 0.015,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: t * 10,
                  right: t * 10,
                  // top: t * 10,
                  bottom: t * 20,
                ),
                height: h * 0.4,
                decoration: BoxDecoration(
                  // color: Colors.yellow,
                  image: imgPath == ""
                      ? DecorationImage(
                          image: AssetImage('images/idea.png'),
                          fit: BoxFit.contain,
                        )
                      : DecorationImage(
                          image: NetworkImage(imgPath),
                          fit: BoxFit.contain,
                        ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Text(
                  desc,
                  style: TextStyle(
                    color: kDark,
                    fontWeight: FontWeight.w500,
                    fontSize: t * 18,
                  ),
                ),
              ),
              if (imgPath != links)
                SizedBox(
                  height: h * 0.015,
                ),
              if (imgPath != links)
                Text(
                  'Links',
                  style: TextStyle(
                    color: kDark,
                    fontStyle: FontStyle.italic,
                    fontFamily: "LobsterTwo",
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              if (imgPath != links)
                SizedBox(
                  height: h * 0.015,
                ),
              if (imgPath != links)
                Container(
                  width: w * 0.85,
                  // color: Colors.blueGrey,
                  child: Center(
                    child: Wrap(
                      spacing: t * 5,
                      runSpacing: t * 6,
                      children: linkChips,
                    ),
                  ),
                ),
              SizedBox(
                height: h * 0.02,
              ),
              Text(
                "Connect with me at 👇🏻",
                style: TextStyle(
                  height: 1.2,
                  letterSpacing: 1,
                  fontSize: t * 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: h * 0.01,
              ),
              EmailChip(email: email),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String category;
  const CategoryChip({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            8,
          ),
        ),
        border: Border.all(
          color: kDark,
          width: 1.5,
        ),
      ),
      child: Center(
        child: Text(
          category,
          style: TextStyle(
            color: kDark,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class LinkChips extends StatelessWidget {
  final String link;
  const LinkChips({
    Key? key,
    required this.link,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // const url = 'https://flutter.io';
        if (await canLaunchUrlString(link)) {
          await launchUrlString(link, mode: LaunchMode.inAppWebView);
        } else {
          throw 'Could not launch $link';
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 3,
          horizontal: 8,
        ),
        decoration: BoxDecoration(
          color: kDark,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Text(
          link.contains('github')
              ? "GitHub"
              : link.contains('youtu.be')
                  ? "YouTube"
                  : link.contains('medium.com')
                      ? "Medium"
                      : link.contains('linkedin.com')
                          ? "LinkedIn"
                          : link,
          style: TextStyle(
            color: Colors.white,
            // fontFamily: 'LobsterTwo',
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class EmailChip extends StatelessWidget {
  final String email;
  const EmailChip({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final uri = Uri(scheme: 'mailto', path: email);
        if (await canLaunchUrl(uri)) {
          launchUrl(uri);
        } else {
          throw 'cannot launch $uri';
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 3,
          horizontal: 8,
        ),
        decoration: BoxDecoration(
          color: kDark,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.mail_outline_rounded,
              color: Colors.white,
            ),
            SizedBox(
              width: 3,
            ),
            Text(
              email,
              style: TextStyle(
                color: Colors.white,
                // fontFamily: 'LobsterTwo',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
