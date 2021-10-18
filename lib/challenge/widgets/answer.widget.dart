import 'package:flutter/material.dart';

import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/shared/models/answer.model.dart';

class AnswerWidget extends StatelessWidget {
  final AnswerModel answer;
  final VoidCallback onPress;
  final bool isDisabled;
  final bool isSelected;

  const AnswerWidget({
    Key? key,
    required this.answer,
    required this.onPress,
    this.isDisabled = false,
    this.isSelected = false,
  }) : super(key: key);

  Color get _correctColor =>
      this.answer.isCorrect ? AppColors.darkGreen : AppColors.darkRed;

  Color get _correctBorder =>
      this.answer.isCorrect ? AppColors.lightGreen : AppColors.lightRed;

  Color get _correctCardColor =>
      this.answer.isCorrect ? AppColors.lightGreen : AppColors.lightRed;

  Color get _correctCardBorderColor =>
      this.answer.isCorrect ? AppColors.green : AppColors.red;

  TextStyle get _correctTextStyle => this.answer.isCorrect
      ? AppTextStyles.bodyDarkGreen
      : AppTextStyles.bodyDarkRed;

  IconData get _correctIcon =>
      this.answer.isCorrect ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: IgnorePointer(
        ignoring: isDisabled,
        child: GestureDetector(
          onTap: onPress,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: isSelected ? _correctCardColor : AppColors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.fromBorderSide(BorderSide(
                    color: isSelected
                        ? _correctCardBorderColor
                        : AppColors.border))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    this.answer.title,
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
                          color:
                              isSelected ? _correctBorder : AppColors.border))),
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
        ),
      ),
    );
  }
}
