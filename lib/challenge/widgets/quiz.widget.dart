import 'package:DevQuiz/challenge/widgets/answer.widget.dart';
import 'package:DevQuiz/core/core.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final String title;
  const QuizWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Text(
          title,
          style: AppTextStyles.heading,
        ),
        SizedBox(
          height: 24,
        ),
        Column(
          children: [
            AnswerWidget(
              title: "Kit de desenvolvimento de interface de usuário",
              isSelected: true,
              isCorrect: true,
            ),
            AnswerWidget(
                isSelected: true,
                title:
                    "Possibilita a criação de aplicativos compilados nativamente"),
            AnswerWidget(
              title: "Acha que é uma marca de café do Himalaia",
            ),
            AnswerWidget(
                title:
                    "Possibilita a criação de desktops que são muito incríveis"),
          ],
        ),
      ],
    ));
  }
}
