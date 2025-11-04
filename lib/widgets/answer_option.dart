import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/text_styles.dart';

class AnswerOption extends StatelessWidget {
  final String optionLetter;
  final String optionText;
  final bool isSelected;
  final VoidCallback onTap;

  const AnswerOption({
    super.key,
    required this.optionLetter,
    required this.optionText,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04,
          vertical: screenHeight * 0.01,
        ),
        padding: EdgeInsets.all(screenWidth * 0.04),
        decoration: BoxDecoration(
          color: isSelected 
              ? AppColors.accentYellow.withOpacity(0.2)
              : AppColors.cardBackground,
          borderRadius: BorderRadius.circular(screenWidth * 0.03),
          border: Border.all(
            color: isSelected 
                ? AppColors.accentYellow 
                : Colors.transparent,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Option Letter (A, B, C, D)
            Container(
              width: screenWidth * 0.1,
              height: screenWidth * 0.1,
              decoration: BoxDecoration(
                color: isSelected 
                    ? AppColors.accentYellow 
                    : AppColors.primaryBlue,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  optionLetter,
                  style: TextStyle(
                    fontFamily: 'Orbitron',
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.bold,
                    color: isSelected 
                        ? AppColors.primaryBlue 
                        : AppColors.textPrimary,
                  ),
                ),
              ),
            ),

            SizedBox(width: screenWidth * 0.04),

            // Option Text
            Expanded(
              child: Text(
                optionText,
                style: AppTextStyles.bodyMedium(screenWidth).copyWith(
                  color: isSelected 
                      ? AppColors.textPrimary 
                      : AppColors.textSecondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}