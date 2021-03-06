import 'package:DevQuiz/challenge/challenge.controller.dart';
import 'package:DevQuiz/result/result.page.dart';
import 'package:flutter/material.dart';

import 'package:DevQuiz/challenge/widgets/next-button.widget.dart';
import 'package:DevQuiz/challenge/widgets/question-indicator.widget.dart';
import 'package:DevQuiz/challenge/widgets/quiz.widget.dart';
import 'package:DevQuiz/shared/models/question.model.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String title;

  ChallengePage({
    Key? key,
    required this.questions,
    required this.title,
  }) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final indexController = PageController();

  @override
  void initState() {
    super.initState();
    indexController.addListener(() {
      this.controller.currentIndex = indexController.page!.toInt() + 1;
    });
  }

  void nextPage() async {
    await Future.delayed(Duration(seconds: 2));

    if (controller.currentIndex < this.widget.questions.length)
      indexController.nextPage(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeIn,
      );
  }

  void onPress(bool value) {
    if (value) this.controller.hits++;

    nextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(102),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButton(),
              ValueListenableBuilder<int>(
                valueListenable: this.controller.currentIndexNotifier,
                builder: (context, value, _) => QuestionIndicatorWidget(
                  currentIndex: value,
                  indexLength: 2,
                ),
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: this.indexController,
        children: [
          ...this.widget.questions.map(
                (e) => QuizWidget(
                  question: e,
                  onPress: this.onPress,
                ),
              ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: ValueListenableBuilder<int>(
            valueListenable: this.controller.currentIndexNotifier,
            builder: (context, value, _) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (value != this.widget.questions.length)
                  Expanded(
                    child: NextButtonWidget.white(
                      label: 'Pular',
                      onPress: this.nextPage,
                    ),
                  ),
                if (value == this.widget.questions.length)
                  SizedBox(
                    width: 7,
                  ),
                if (value == this.widget.questions.length)
                  Expanded(
                    child: NextButtonWidget.green(
                      label: 'Confirmar',
                      onPress: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ResultPage(
                              title: this.widget.title,
                              length: this.widget.questions.length,
                              hits: this.controller.hits,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
