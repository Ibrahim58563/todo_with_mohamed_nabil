import 'package:flutter/material.dart';

class MyThemeData {
  static const Color lightScaffoldBackground =
      Color.fromARGB(255, 223, 236, 219);
  static final ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: lightScaffoldBackground,
      primarySwatch: Colors.blue,
      textTheme: TextTheme(
          headline1: TextStyle(
            color: Colors.black,
            fontSize: 32,
          ),
          headline2: TextStyle(fontSize: 28, color: Colors.black),
          subtitle1: TextStyle(fontSize: 18, color: Colors.black),
          subtitle2: TextStyle(fontSize: 16, color: Colors.grey)));
}
