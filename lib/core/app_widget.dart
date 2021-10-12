import 'package:DevQuiz/challenge/challenge.page.dart';
// import 'package:DevQuiz/home/home.page.dart';
// import 'package:DevQuiz/splash/splash.page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DevQuiz",
      home: ChallengePage(),
    );
  }
}
