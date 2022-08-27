// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ideagram_v2/constants.dart';
import 'package:ideagram_v2/screens/input_screen.dart';
import 'package:ideagram_v2/screens/project_display_screen.dart';

class ProjectListScreen extends StatelessWidget {
  const ProjectListScreen({Key? key}) : super(key: key);
  static const String id = "/proj_list";

  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    final t = MediaQuery.of(context).textScaleFactor;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kSky,
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
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: kDark,
          title: kText,
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: db.collection('projects').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child:
                      Text('An unexpected error occurred. Please restart app'),
                );
              } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                final List? proj = snapshot.data?.docs;
                // print(proj!.length);
                // ignore: sized_box_for_whitespace
                return Container(
                  width: w,
                  height: h,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return ProjectTile(
                        links: '${proj[index]['Links']}',
                        title: '${proj[index]['Title']}',
                        author: '${proj[index]['Author']}',
                        email: '${proj[index]['E-mail']}',
                        category: '${proj[index]['Category']}',
                        imgPath: proj[index]['Image'] != null
                            ? '${proj[index]['Image']}'
                            : '',
                        caption: '${proj[index]['About']}',
                        desc: '${proj[index]['Description']}',
                      );
                      // return Text('${proj[index]['Title']}');
                    },
                    itemCount: proj!.length,
                  ),
                );
              } else if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'No Projects found. Add a new project',
                        textAlign: TextAlign.center,
                        maxLines: 5,
                        softWrap: true,
                        style: TextStyle(
                          fontSize: t * 26,
                          color: kDark.withOpacity(
                            0.29,
                          ),
                          fontWeight: FontWeight.bold,
                          // height: t * 13,
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return Center(
                    child: CircularProgressIndicator(
                  color: kDark,
                ));
              }
            }),
        floatingActionButton: FloatingActionButton(
          backgroundColor: kDark,
          onPressed: () {
            Navigator.pushNamed(context, InputsScreen.id);
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ProjectTile extends StatelessWidget {
  final String title;
  final String author;
  final String email;
  final String category;
  final String imgPath;
  final String caption;
  final String desc;
  final String links;

  const ProjectTile({
    Key? key,
    required this.title,
    required this.author,
    required this.email,
    required this.category,
    required this.imgPath,
    required this.caption,
    required this.desc,
    required this.links,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> cat = category.split(',');
    List<CategoryTile> text = [];
    // ignore: avoid_function_literals_in_foreach_calls
    cat.forEach((element) {
      text.add(CategoryTile(category: element));
    });
    return Container(
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 10,
        bottom: 10,
      ),
      decoration: BoxDecoration(
          color: Color(0xffF5FCFF),
          borderRadius: BorderRadius.all(
            Radius.circular(
              15,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 2,
              offset: Offset(0, 2),
            )
          ]),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ProjectDisplayScreen(
                  title: title,
                  author: author,
                  email: email,
                  about: caption,
                  desc: desc,
                  categories: category,
                  links: links,
                  imgPath: imgPath,
                );
              },
            ),
          );
        },
        horizontalTitleGap: 16,
        minVerticalPadding: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              15,
            ),
          ),
        ),
        leading: Container(
          width: MediaQuery.of(context).size.width * 0.25,
          // height: MediaQuery.of(context).size.height * 0.3,
          decoration: BoxDecoration(
            // color: Colors.yellow,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            border: Border.all(
              width: 1.5,
              color: kDark,
            ),
            image: imgPath != ''
                ? DecorationImage(
                    image: NetworkImage(imgPath),
                    fit: BoxFit.cover,
                  )
                : DecorationImage(
                    image: AssetImage('images/idea.png'),
                    fit: BoxFit.contain,
                  ),
          ),
        ),
        title: Text(
          title.toUpperCase(),
          softWrap: true,
          style: TextStyle(
            color: kDark,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        tileColor: Colors.white,
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              caption,
              softWrap: true,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Chip(
                //   label: Text(
                //     category,
                //   ),
                // ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  // color: Colors.yellow,
                  child: Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    children: text,
                  ),
                ),
                Spacer(),
                Text(
                  'By $author',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.75),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String category;
  const CategoryTile({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 2,
        horizontal: 5,
      ),
      decoration: BoxDecoration(
          color: kDark,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          )),
      child: Text(
        category,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
