import 'package:flutter/material.dart';

import 'package:DevQuiz/challenge/widgets/answer.widget.dart';
import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/shared/models/answer.model.dart';
import 'package:DevQuiz/shared/models/question.model.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final ValueChanged<bool> onPress;

  const QuizWidget({
    Key? key,
    required this.question,
    required this.onPress,
  }) : super(key: key);

  @override
  State<QuizWidget> createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int selectedAnswer = -1;

  AnswerModel answer(int index) => this.widget.question.answers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        SizedBox(
          height: 64,
        ),
        Text(
          this.widget.question.title,
          style: AppTextStyles.heading,
        ),
        SizedBox(
          height: 24,
        ),
        for (int i = 0; i < this.widget.question.answers.length; i++)
          AnswerWidget(
            answer: this.answer(i),
            isDisabled: selectedAnswer != -1,
            isSelected: selectedAnswer == i,
            onPress: (value) {
              selectedAnswer = i;
              this.widget.onPress(value);
              setState(() {});
            },
          ),
      ],
    ));
  }
}
