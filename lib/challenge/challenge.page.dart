import 'package:DevQuiz/challenge/widgets/question-indicator.widget.dart';
import 'package:DevQuiz/challenge/widgets/quiz.widget.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  const ChallengePage({Key? key}) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SafeArea(child: QuestionIndicatorWidget()),
      ),
      body: QuizWidget(
        title: 'O que o Flutter faz em sua totalidade?',
      ),
    );
  }
}
