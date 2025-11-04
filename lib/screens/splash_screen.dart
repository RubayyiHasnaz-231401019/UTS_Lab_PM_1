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

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    
    // Setup animations
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack),
    );

    _animationController.forward();

    // Navigate after delay
    Timer(const Duration(seconds: AppConstants.splashDuration), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const WelcomeScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
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
            // Logo with animation
            FadeTransition(
              opacity: _fadeAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Container(
                  width: screenWidth * 0.5,
                  height: screenWidth * 0.5,
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
                    child: Image.asset(
                      'assets/images/splash_logo.png',
                      width: screenWidth * 0.35,
                      height: screenWidth * 0.35,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.rocket_launch,
                          size: screenWidth * 0.25,
                          color: AppColors.accentYellow,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: screenHeight * 0.05),

            // App Name
            FadeTransition(
              opacity: _fadeAnimation,
              child: Text(
                AppConstants.appName,
                style: AppTextStyles.heading1(screenWidth).copyWith(
                  color: AppColors.accentYellow,
                ),
              ),
            ),

            SizedBox(height: screenHeight * 0.01),

            // Description
            FadeTransition(
              opacity: _fadeAnimation,
              child: Text(
                AppConstants.appDescription,
                style: AppTextStyles.bodyMedium(screenWidth),
                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(height: screenHeight * 0.05),

            // Loading indicator
            FadeTransition(
              opacity: _fadeAnimation,
              child: SizedBox(
                width: screenWidth * 0.15,
                height: screenWidth * 0.15,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.accentYellow,
                  ),
                  strokeWidth: 3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}