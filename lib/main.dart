import 'dart:js';

import 'package:flutter/material.dart';
import 'package:note_app_db_stm/provider/provider.dart';
import 'package:note_app_db_stm/ui_screens/splash_screen.dart';
import 'package:provider/provider.dart';

import 'ui_screens/add_note_screen.dart';
import 'ui_screens/home_screen.dart';
import 'ui_screens/login_screen.dart';

void main() {
  runApp(
   ChangeNotifierProvider(
     create: (context) => NotesProvider(),
     child: MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}
