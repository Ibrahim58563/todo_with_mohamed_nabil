import 'package:flutter/material.dart';
import 'package:todo_with_mohamed_nabil/my_theme_data.dart';
import 'package:todo_with_mohamed_nabil/ui/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyThemeData.lightTheme,
      routes: {HomeScreen.routeName: (buildContext) => HomeScreen()},
      initialRoute: HomeScreen.routeName,
    );
  }
}
