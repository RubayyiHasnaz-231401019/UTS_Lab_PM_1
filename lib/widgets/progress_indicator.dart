import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/text_styles.dart';

class QuizProgressIndicator extends StatelessWidget {
  final int currentQuestion;
  final int totalQuestions;

  const QuizProgressIndicator({
    super.key,
    required this.currentQuestion,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final progress = currentQuestion / totalQuestions;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04,
        vertical: screenHeight * 0.02,
      ),
      child: Column(
        children: [
          // Progress text
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Soal $currentQuestion dari $totalQuestions',
                style: AppTextStyles.bodyMedium(screenWidth),
              ),
              Text(
                '${(progress * 100).toInt()}%',
                style: AppTextStyles.bodyMedium(screenWidth).copyWith(
                  color: AppColors.accentYellow,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          SizedBox(height: screenHeight * 0.01),

          // Progress bar
          ClipRRect(
            borderRadius: BorderRadius.circular(screenWidth * 0.02),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: AppColors.cardBackground,
              valueColor: const AlwaysStoppedAnimation<Color>(
                AppColors.accentYellow,
              ),
              minHeight: screenHeight * 0.01,
            ),
          ),
        ],
      ),
    );
  }
}