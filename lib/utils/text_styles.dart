import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Headers
  static TextStyle heading1(double screenWidth) => TextStyle(
    fontFamily: 'Orbitron',
    fontSize: screenWidth * 0.08,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static TextStyle heading2(double screenWidth) => TextStyle(
    fontFamily: 'Orbitron',
    fontSize: screenWidth * 0.06,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static TextStyle heading3(double screenWidth) => TextStyle(
    fontFamily: 'Poppins',
    fontSize: screenWidth * 0.05,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  // Body Text
  static TextStyle bodyLarge(double screenWidth) => TextStyle(
    fontFamily: 'Poppins',
    fontSize: screenWidth * 0.045,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
  );

  static TextStyle bodyMedium(double screenWidth) => TextStyle(
    fontFamily: 'Poppins',
    fontSize: screenWidth * 0.04,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
  );

  static TextStyle bodySmall(double screenWidth) => TextStyle(
    fontFamily: 'Poppins',
    fontSize: screenWidth * 0.035,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
  );

  // Button Text
  static TextStyle button(double screenWidth) => TextStyle(
    fontFamily: 'Poppins',
    fontSize: screenWidth * 0.045,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  // Caption
  static TextStyle caption(double screenWidth) => TextStyle(
    fontFamily: 'Poppins',
    fontSize: screenWidth * 0.03,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
  );
}