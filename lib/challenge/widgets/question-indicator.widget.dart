import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/shared/widget/progress-indicator.widget.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int currentIndex;
  final int indexLength;

  const QuestionIndicatorWidget({
    Key? key,
    required this.currentIndex,
    required this.indexLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Questão $currentIndex',
                style: AppTextStyles.body,
              ),
              Text(
                'de $indexLength',
                style: AppTextStyles.body,
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          ProgressIndicatorWidget(progress: currentIndex / indexLength),
        ],
      ),
    );
  }
}
