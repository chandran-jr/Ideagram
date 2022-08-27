// ignore_for_file: prefer_const_constructors

// import 'dart:js';

import 'package:flutter/material.dart';
import './screens/project_list_screen.dart';
import './screens/landing_screen.dart';
import './screens/input_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  runApp(MaterialApp(
    title: "Ideagram",
    debugShowCheckedModeBanner: false,
    initialRoute: HomeScreen.id,
    routes: {
      HomeScreen.id: (context) => HomeScreen(),
      ProjectListScreen.id: (context) => ProjectListScreen(),
      InputsScreen.id: (context) => InputsScreen(),
    },
  ));
}
