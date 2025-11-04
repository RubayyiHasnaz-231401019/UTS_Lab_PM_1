import 'package:flutter/material.dart';
import '../models/question.dart';
import '../utils/app_colors.dart';
import '../utils/text_styles.dart';

class ResultCard extends StatelessWidget {
  final Question question;
  final int? userAnswer;
  final int questionNumber;

  const ResultCard({
    super.key,
    required this.question,
    required this.userAnswer,
    required this.questionNumber,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isCorrect = userAnswer == question.correctAnswerIndex;
    final isSkipped = userAnswer == null;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04,
        vertical: screenHeight * 0.01,
      ),
      padding: EdgeInsets.all(screenWidth * 0.04),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(screenWidth * 0.04),
        border: Border.all(
          color: isSkipped
              ? AppColors.textSecondary
              : (isCorrect ? AppColors.correctGreen : AppColors.wrongRed),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Question number and status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Soal $questionNumber',
                style: AppTextStyles.heading3(screenWidth),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.03,
                  vertical: screenHeight * 0.005,
                ),
                decoration: BoxDecoration(
                  color: isSkipped
                      ? AppColors.textSecondary
                      : (isCorrect ? AppColors.correctGreen : AppColors.wrongRed),
                  borderRadius: BorderRadius.circular(screenWidth * 0.02),
                ),
                child: Text(
                  isSkipped ? 'Tidak Dijawab' : (isCorrect ? 'Benar' : 'Salah'),
                  style: AppTextStyles.bodySmall(screenWidth).copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: screenHeight * 0.015),

          // Question text
          Text(
            question.questionText,
            style: AppTextStyles.bodyMedium(screenWidth),
          ),

          SizedBox(height: screenHeight * 0.015),

          // Options
          ...List.generate(question.options.length, (index) {
            final isUserAnswer = userAnswer == index;
            final isCorrectAnswer = question.correctAnswerIndex == index;

            return Container(
              margin: EdgeInsets.only(bottom: screenHeight * 0.01),
              padding: EdgeInsets.all(screenWidth * 0.03),
              decoration: BoxDecoration(
                color: isCorrectAnswer
                    ? AppColors.correctGreen.withOpacity(0.2)
                    : (isUserAnswer
                        ? AppColors.wrongRed.withOpacity(0.2)
                        : Colors.transparent),
                borderRadius: BorderRadius.circular(screenWidth * 0.02),
                border: Border.all(
                  color: isCorrectAnswer
                      ? AppColors.correctGreen
                      : (isUserAnswer ? AppColors.wrongRed : AppColors.textSecondary),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Text(
                    '${String.fromCharCode(65 + index)}. ',
                    style: AppTextStyles.bodyMedium(screenWidth).copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      question.options[index],
                      style: AppTextStyles.bodySmall(screenWidth),
                    ),
                  ),
                  if (isCorrectAnswer)
                    Icon(
                      Icons.check_circle,
                      color: AppColors.correctGreen,
                      size: screenWidth * 0.05,
                    ),
                  if (isUserAnswer && !isCorrectAnswer)
                    Icon(
                      Icons.cancel,
                      color: AppColors.wrongRed,
                      size: screenWidth * 0.05,
                    ),
                ],
              ),
            );
          }),

          SizedBox(height: screenHeight * 0.01),

          // Explanation
          Container(
            padding: EdgeInsets.all(screenWidth * 0.03),
            decoration: BoxDecoration(
              color: AppColors.primaryBlue.withOpacity(0.3),
              borderRadius: BorderRadius.circular(screenWidth * 0.02),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.lightbulb_outline,
                  color: AppColors.accentYellow,
                  size: screenWidth * 0.05,
                ),
                SizedBox(width: screenWidth * 0.02),
                Expanded(
                  child: Text(
                    question.explanation,
                    style: AppTextStyles.bodySmall(screenWidth),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}