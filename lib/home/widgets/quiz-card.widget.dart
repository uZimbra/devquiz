import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/shared/widget/progress-indicator.widget.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final String progress;
  final double percentage;
  final VoidCallback onPress;

  QuizCardWidget({
    Key? key,
    required this.title,
    required this.progress,
    required this.percentage,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
            color: AppColors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: 40,
              child: Image.asset(AppImages.blocks),
            ),
            SizedBox(
              height: 24,
            ),
            Text(this.title, style: AppTextStyles.heading15),
            SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Expanded(
                    flex: 1, child: Text(progress, style: AppTextStyles.body11)),
                Expanded(
                    flex: 2,
                    child: ProgressIndicatorWidget(
                      progress: percentage,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
