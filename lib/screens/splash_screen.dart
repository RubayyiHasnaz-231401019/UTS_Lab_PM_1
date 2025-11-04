import 'package:flutter/material.dart';
import 'dart:async';
import '../utils/app_colors.dart';
import '../utils/text_styles.dart';
import '../utils/constants.dart';
import 'welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: AppConstants.splashDuration), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.backgroundGradient,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Container(
              width: screenWidth * 0.4,
              height: screenWidth * 0.4,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.accentYellow.withOpacity(0.2),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.accentYellow.withOpacity(0.3),
                    blurRadius: 30,
                    spreadRadius: 10,
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  Icons.rocket_launch,
                  size: screenWidth * 0.2,
                  color: AppColors.accentYellow,
                ),
              ),
            ),

            SizedBox(height: screenHeight * 0.05),

            // App Name
            Text(
              AppConstants.appName,
              style: AppTextStyles.heading1(screenWidth).copyWith(
                color: AppColors.accentYellow,
              ),
            ),

            SizedBox(height: screenHeight * 0.01),

            // Description
            Text(
              AppConstants.appDescription,
              style: AppTextStyles.bodyMedium(screenWidth),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: screenHeight * 0.05),

            // Loading indicator
            SizedBox(
              width: screenWidth * 0.15,
              height: screenWidth * 0.15,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  AppColors.accentYellow,
                ),
                strokeWidth: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}