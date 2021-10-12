import 'package:DevQuiz/core/core.dart';
import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  final String title;
  final bool isCorrect;
  final bool isSelected;

  const AnswerWidget(
      {Key? key,
      required this.title,
      this.isCorrect = false,
      this.isSelected = false})
      : super(key: key);

  Color get _correctColor =>
      isCorrect ? AppColors.darkGreen : AppColors.darkRed;

  Color get _correctBorder =>
      isCorrect ? AppColors.lightGreen : AppColors.lightRed;

  Color get _correctCardColor =>
      isCorrect ? AppColors.lightGreen : AppColors.lightRed;

  Color get _correctCardBorderColor =>
      isCorrect ? AppColors.green : AppColors.red;

  TextStyle get _correctTextStyle =>
      isCorrect ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  IconData get _correctIcon => isCorrect ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: isSelected ? _correctCardColor : AppColors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.fromBorderSide(BorderSide(
                color:
                    isSelected ? _correctCardBorderColor : AppColors.border))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                style: isSelected ? _correctTextStyle : AppTextStyles.body,
              ),
            ),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                  color: isSelected ? _correctColor : AppColors.white,
                  borderRadius: BorderRadius.circular(500),
                  border: Border.fromBorderSide(BorderSide(
                      color: isSelected ? _correctBorder : AppColors.border))),
              child: isSelected
                  ? Icon(
                      _correctIcon,
                      size: 16,
                    )
                  : null,
            )
          ],
        ),
      ),
    );
  }
}
