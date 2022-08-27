// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'dart:io';

class InputsScreen extends StatefulWidget {
  static const String id = "/inputScreen";
  const InputsScreen({Key? key}) : super(key: key);

  @override
  State<InputsScreen> createState() => _InputsScreenState();
}

class _InputsScreenState extends State<InputsScreen> {
  final formGlobalKey = GlobalKey<FormState>();
  File? imgFile;
  String imgPath = "";
  TextEditingController titleControl = TextEditingController();
  TextEditingController emailControl = TextEditingController();
  TextEditingController authorControl = TextEditingController();
  TextEditingController descControl = TextEditingController();
  TextEditingController linkControl = TextEditingController();
  TextEditingController categoryControl = TextEditingController();
  TextEditingController aboutControl = TextEditingController();
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
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
                10,
              ),
              bottomRight: Radius.circular(
                10,
              ),
            ),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: kDark,
          title: kText,
        ),
        body: SingleChildScrollView(
          child: Column(
            key: formGlobalKey,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //title
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: t * 5,
                ),
                margin: EdgeInsets.symmetric(
                  vertical: t * 15,
                  horizontal: t * 30,
                ),
                width: w * 0.85,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: kDark,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(t * 8),
                  ),
                ),
                child: Center(
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    validator: (s) {
                      if (s!.isEmpty) {
                        return 'Please enter title';
                      }
                      if (s.contains('Fuck') ||
                          s.contains('Stupid') ||
                          s.contains('Idiot')) {
                        return "Please avoid abusive language";
                      }
                      if (s.contains('.') || s.contains('/')) {
                        return "Avoid using . and /";
                      }
                      return null;
                    },
                    controller: titleControl,
                    cursorColor: kDark,
                    style: TextStyle(
                      color: kDark,
                      fontSize: t * 18,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      filled: false,
                      border: InputBorder.none,
                      hintText: 'Enter Project/Idea title*',
                      hintStyle: TextStyle(
                        color: kDark.withOpacity(
                          0.4,
                        ),
                        fontSize: t * 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              //author
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: t * 5,
                ),
                margin: EdgeInsets.symmetric(
                  vertical: t * 15,
                  horizontal: t * 30,
                ),
                width: w * 0.85,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: kDark,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(t * 8),
                  ),
                ),
                child: Center(
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    validator: (s) {
                      if (s!.isEmpty) {
                        return 'Please enter Name of Author';
                      }
                      if (s.contains('Fuck') ||
                          s.contains('Stupid') ||
                          s.contains('Idiot')) {
                        return "Please avoid abusive language";
                      }
                      if (s.contains('.') || s.contains('/')) {
                        return "Avoid using . and /";
                      }
                      return null;
                    },
                    controller: authorControl,
                    cursorColor: kDark,
                    style: TextStyle(
                      color: kDark,
                      fontSize: t * 18,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      filled: false,
                      border: InputBorder.none,
                      hintText: 'Enter author name*',
                      hintStyle: TextStyle(
                        color: kDark.withOpacity(
                          0.4,
                        ),
                        fontSize: t * 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              //email
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: t * 5,
                ),
                margin: EdgeInsets.symmetric(
                  vertical: t * 15,
                  horizontal: t * 30,
                ),
                width: w * 0.85,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: kDark,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(t * 8),
                  ),
                ),
                child: Center(
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (s) {
                      if (s!.isEmpty) {
                        return 'Please enter email';
                      }
                      if (s.contains('Fuck') ||
                          s.contains('Stupid') ||
                          s.contains('Idiot')) {
                        return "Please avoid abusive language";
                      }
                      if (s.contains('/')) {
                        return "Avoid using /";
                      }
                      if (!(s.contains('@'))) {
                        return 'Please enter valid email';
                      }
                      return null;
                    },
                    controller: emailControl,
                    cursorColor: kDark,
                    style: TextStyle(
                      color: kDark,
                      fontSize: t * 18,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      filled: false,
                      border: InputBorder.none,
                      hintText: 'Enter E-Mail*',
                      hintStyle: TextStyle(
                        color: kDark.withOpacity(
                          0.4,
                        ),
                        fontSize: t * 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              //About
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: t * 5,
                ),
                margin: EdgeInsets.symmetric(
                  vertical: t * 15,
                  horizontal: t * 30,
                ),
                width: w * 0.85,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: kDark,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(t * 8),
                  ),
                ),
                child: Center(
                  child: TextFormField(
                    minLines: 1,
                    maxLines: 3,
                    keyboardType: TextInputType.text,
                    validator: (s) {
                      if (s!.isEmpty) {
                        return 'Please enter short description of project';
                      }
                      if (s.contains('Fuck') ||
                          s.contains('Stupid') ||
                          s.contains('Idiot')) {
                        return "Please avoid abusive language";
                      }
                      if (s.contains('.') || s.contains('/')) {
                        return "Avoid using . and /";
                      }
                      return null;
                    },
                    controller: aboutControl,
                    cursorColor: kDark,
                    style: TextStyle(
                      color: kDark,
                      fontSize: t * 18,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      filled: false,
                      border: InputBorder.none,
                      hintText: 'Enter 1 line about project/idea*',
                      hintStyle: TextStyle(
                        color: kDark.withOpacity(
                          0.4,
                        ),
                        fontSize: t * 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              //Description
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: t * 5,
                ),
                margin: EdgeInsets.symmetric(
                  vertical: t * 15,
                  horizontal: t * 30,
                ),
                width: w * 0.85,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: kDark,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(t * 8),
                  ),
                ),
                child: Center(
                  child: TextFormField(
                    minLines: 1,
                    maxLines: 15,
                    keyboardType: TextInputType.multiline,
                    validator: (s) {
                      // if (s!.isEmpty) {
                      //   return 'Please enter short description of project';
                      // }
                      if (s!.contains('Fuck') ||
                          s.contains('Stupid') ||
                          s.contains('Idiot')) {
                        return "Please avoid abusive language";
                      }

                      return null;
                    },
                    controller: descControl,
                    cursorColor: kDark,
                    style: TextStyle(
                      color: kDark,
                      fontSize: t * 18,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      filled: false,
                      border: InputBorder.none,
                      hintText: 'Enter Project/Idea description',
                      hintStyle: TextStyle(
                        color: kDark.withOpacity(
                          0.4,
                        ),
                        fontSize: t * 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              //Links
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: t * 5,
                ),
                margin: EdgeInsets.symmetric(
                  vertical: t * 15,
                  horizontal: t * 30,
                ),
                width: w * 0.85,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: kDark,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(t * 8),
                  ),
                ),
                child: Center(
                  child: TextFormField(
                    minLines: 1,
                    maxLines: 6,
                    keyboardType: TextInputType.text,
                    validator: (s) {
                      if (s!.isEmpty) {
                        return 'Please provide links of the project';
                      }
                      if (s.contains('Fuck') ||
                          s.contains('Stupid') ||
                          s.contains('Idiot')) {
                        return "Please avoid abusive language";
                      }
                      if (!(s.contains('http'))) {
                        return "Please enter valid link";
                      }
                      return null;
                    },
                    controller: linkControl,
                    cursorColor: kDark,
                    style: TextStyle(
                      color: kDark,
                      fontSize: t * 18,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      filled: false,
                      border: InputBorder.none,
                      hintText: 'Enter project links separated by comma*',
                      hintStyle: TextStyle(
                        color: kDark.withOpacity(
                          0.4,
                        ),
                        fontSize: t * 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              //Category
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: t * 5,
                ),
                margin: EdgeInsets.symmetric(
                  vertical: t * 15,
                  horizontal: t * 30,
                ),
                width: w * 0.85,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: kDark,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(t * 8),
                  ),
                ),
                child: Center(
                  child: TextFormField(
                    minLines: 1,
                    maxLines: 3,
                    keyboardType: TextInputType.text,
                    validator: (s) {
                      if (s!.isEmpty) {
                        return 'Please enter project category';
                      }
                      if (s.contains('Fuck') ||
                          s.contains('Stupid') ||
                          s.contains('Idiot')) {
                        return "Please avoid abusive language";
                      }
                      if (s.contains('.')) {
                        return "Avoid using .";
                      }
                      return null;
                    },
                    controller: categoryControl,
                    cursorColor: kDark,
                    style: TextStyle(
                      color: kDark,
                      fontSize: t * 18,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      filled: false,
                      border: InputBorder.none,
                      hintText: 'Enter project category seperated by comma*',
                      hintStyle: TextStyle(
                        color: kDark.withOpacity(
                          0.4,
                        ),
                        fontSize: t * 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              //add image
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: t * 5,
                ),
                margin: EdgeInsets.symmetric(
                  vertical: t * 15,
                  horizontal: t * 30,
                ),
                width: w * 0.85,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      imgFile == null
                          ? 'Add image'
                          : 'Image added successfully',
                      style: TextStyle(
                        color: kDark.withOpacity(
                          0.8,
                        ),
                        fontSize: t * 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: h * 0.015,
                    ),
                    DottedBorder(
                      borderType: BorderType.RRect,
                      strokeCap: StrokeCap.round,
                      dashPattern: [6, 4],
                      color: kDark,
                      strokeWidth: 2,
                      child: imgFile == null
                          ? GestureDetector(
                              onTap: () {
                                showAlertDialog(context);
                              },
                              child: SizedBox(
                                height: h * 0.1,
                                child: Center(
                                  child: Text(
                                    '+',
                                    style: TextStyle(
                                      color: kDark.withOpacity(
                                        0.8,
                                      ),
                                      fontSize: t * 30,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  imgFile!.path.substring(
                                    imgFile!.path.lastIndexOf('/') + 1,
                                  ),
                                  style: TextStyle(
                                    color: kDark.withOpacity(0.5),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                    ),
                    if (imgFile != null)
                      SizedBox(
                        height: 5,
                      ),
                    if (imgFile != null)
                      Center(
                        child: Container(
                          width: w * 0.4,
                          margin: EdgeInsets.only(
                            bottom: h * 0.01,
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kDark,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    t * 10,
                                  ),
                                ),
                              ),
                              elevation: 5,
                            ),
                            onPressed: () {
                              uploadImageToFirebase(context);
                            },
                            child: Center(
                              child: Text(
                                'Upload Image',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: t * 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              Container(
                width: w * 0.3,
                margin: EdgeInsets.only(
                  bottom: h * 0.05,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kDark,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          t * 10,
                        ),
                      ),
                    ),
                    elevation: 5,
                  ),
                  onPressed: () {
                    if ((titleControl.text.isEmpty ||
                            aboutControl.text.isEmpty ||
                            authorControl.text.isEmpty ||
                            emailControl.text.isEmpty ||
                            categoryControl.text.isEmpty) ||
                        (linkControl.text.isEmpty && imgFile == null)) {
                      showErrorAlertDialog(context);
                    } else {
                      uploadToFirestore(context);
                      titleControl.clear();
                      aboutControl.clear();
                      authorControl.clear();
                      emailControl.clear();
                      descControl.clear();
                      categoryControl.clear();
                      linkControl.clear();
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    'SAVE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: t * 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    Widget cameraButton = TextButton(
      onPressed: () {
        Navigator.pop(context);
        pickImageCam();
      },
      child: Text(
        "Camera",
        style: TextStyle(color: kDark),
      ),
    );
    Widget galleryButton = TextButton(
      onPressed: () {
        Navigator.pop(context);
        pickImageGal();
      },
      child: Text(
        "Gallery",
        style: TextStyle(color: kDark),
      ),
    );
    Widget deleteButton = TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text(
        "Cancel",
        style: TextStyle(color: kDark),
      ),
    );
    AlertDialog alert = AlertDialog(
      title: Text(
        "Select Image source",
      ),
      content: Text('Choose source from which image is to be uploaded'),
      actions: [
        cameraButton,
        galleryButton,
        deleteButton,
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  pickImageCam() async {
    var pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      imgFile = File(pickedImage!.path);
    });
  }

  pickImageGal() async {
    var pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      imgFile = File(pickedImage!.path);
    });
  }

  uploadImageToFirebase(BuildContext context) async {
    String filename = basename(imgFile!.path);
    Reference reference = FirebaseStorage.instance
        .ref()
        .child('${authorControl.text}/${titleControl.text}/$filename');
    UploadTask uploadTask = reference.putFile(imgFile!);
    uploadTask.snapshotEvents.listen((event) async {
      if (event.state == TaskState.success) {
        final String downloadURL = await event.ref.getDownloadURL();
        await event.ref
            .getDownloadURL()
            .then((value) => showUploadStatusAlert(context, downloadURL));
      }
    });
  }

  showUploadStatusAlert(BuildContext context, String url) {
    Widget okButton = TextButton(
      onPressed: () {
        setState(() {
          imgPath = url;
        });
        Navigator.pop(context);
      },
      child: Text(
        'OK',
        style: TextStyle(
          color: kDark,
        ),
      ),
    );
    AlertDialog alert = AlertDialog(
      title: Text(
        'Image upload status',
        style: TextStyle(color: kDark),
      ),
      content: Text(
        'Image uploaded successfully',
        style: TextStyle(color: kDark),
      ),
      actions: [
        okButton,
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  showErrorAlertDialog(BuildContext context) {
    // set up the buttons
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "Error uploading",
        style: TextStyle(
          color: kDark,
        ),
      ),
      content: Text(
          "Please make sure fields marked with * are not null and please add an image if you don't have any links"),
      actions: [
        okButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  uploadToFirestore(BuildContext context) async {
    await db.collection('projects').add({
      'Title': titleControl.text,
      'Author': authorControl.text,
      'E-mail': emailControl.text,
      'About': aboutControl.text,
      'Description':
          descControl.text.isEmpty ? aboutControl.text : descControl.text,
      'Category': categoryControl.text,
      'Links': linkControl.text.isEmpty ? imgPath : linkControl.text,
      'Image': imgPath != "" ? imgPath : "",
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    titleControl.dispose();
    authorControl.dispose();
    aboutControl.dispose();
    emailControl.dispose();
    descControl.dispose();
    linkControl.dispose();
    categoryControl.dispose();

    super.dispose();
  }
}
