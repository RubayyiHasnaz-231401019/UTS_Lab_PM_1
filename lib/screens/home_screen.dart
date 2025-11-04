import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/categories_data.dart';
import '../providers/user_provider.dart';
import '../providers/quiz_provider.dart';
import '../providers/theme_provider.dart';
import '../utils/app_colors.dart';
import '../utils/text_styles.dart';
import '../widgets/category_card.dart';
import '../widgets/bottom_nav_bar.dart';
import 'quiz_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void _onNavTap(int index) {
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProfileScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final userName = Provider.of<UserProvider>(context).userName;
    final quizProvider = Provider.of<QuizProvider>(context, listen: false);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: themeProvider.isDarkMode
                ? AppColors.backgroundGradient
                : [
                    const Color(0xFFE3F2FD),
                    const Color(0xFFBBDEFB),
                    const Color(0xFF90CAF9),
                  ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Container(
                padding: EdgeInsets.all(screenWidth * 0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Halo, $userName',
                          style: AppTextStyles.heading2(screenWidth).copyWith(
                            color: themeProvider.isDarkMode
                                ? Colors.white
                                : Colors.black87,
                          ),
                        ),
                        Text(
                          'Pilih kategori quiz',
                          style: AppTextStyles.bodyMedium(screenWidth).copyWith(
                            color: themeProvider.isDarkMode
                                ? AppColors.textSecondary
                                : Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    // Theme Toggle Button
                    GestureDetector(
                      onTap: () {
                        themeProvider.toggleTheme();
                      },
                      child: Container(
                        padding: EdgeInsets.all(screenWidth * 0.03),
                        decoration: BoxDecoration(
                          color: themeProvider.isDarkMode
                              ? AppColors.accentYellow
                              : Colors.amber,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Icon(
                          themeProvider.isDarkMode
                              ? Icons.wb_sunny
                              : Icons.nightlight_round,
                          color: themeProvider.isDarkMode
                              ? AppColors.primaryBlue
                              : Colors.white,
                          size: screenWidth * 0.06,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: screenHeight * 0.02),

              // Categories List
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.only(bottom: screenHeight * 0.02),
                  itemCount: CategoriesData.categories.length,
                  itemBuilder: (context, index) {
                    final category = CategoriesData.categories[index];
                    return CategoryCard(
                      category: category,
                      onTap: () {
                        quizProvider.startQuiz(category.id, category.name);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const QuizScreen(),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onNavTap,
      ),
    );
  }
}