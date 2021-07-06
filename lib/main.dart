import 'package:flutter/material.dart';
import 'package:vr_todo/constants/style.dart';
import 'screens/landing_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(textTheme: textTheme),
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    );
  }
}
