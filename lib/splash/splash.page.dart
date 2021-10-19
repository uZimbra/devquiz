import 'package:DevQuiz/core/app_gradients.dart';
import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/home/home.page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  void navigate(BuildContext context) async {
    await Future.delayed(Duration(seconds: 2));

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    this.navigate(context);

    return Scaffold(
        body: Container(
      decoration: BoxDecoration(gradient: AppGradients.linear),
      child: Center(
        child: Image.asset(AppImages.logo),
      ),
    ));
  }
}
