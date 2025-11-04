import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../providers/user_provider.dart';
import '../utils/app_colors.dart';
import '../utils/text_styles.dart';
import '../widgets/result_card.dart';
import 'home_screen.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  void initState() {
    super.initState();
    // Save quiz result
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final quizProvider = Provider.of<QuizProvider>(context, listen: false);
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      final result = quizProvider.getQuizResult();
      userProvider.addQuizResult(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return PopScope(
      canPop: false,
      child: Scaffold(
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
          child: SafeArea(
            child: Consumer<QuizProvider>(
              builder: (context, quizProvider, child) {
                final result = quizProvider.getQuizResult();

                return Column(
                  children: [
                    // Header Score Card
                    Container(
                      margin: EdgeInsets.all(screenWidth * 0.04),
                      padding: EdgeInsets.all(screenWidth * 0.05),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: AppColors.cardGradient,
                        ),
                        borderRadius: BorderRadius.circular(screenWidth * 0.05),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          // Trophy Icon
                          Icon(
                            Icons.emoji_events,
                            size: screenWidth * 0.2,
                            color: AppColors.accentYellow,
                          ),

                          SizedBox(height: screenHeight * 0.02),

                          // Score
                          Text(
                            '${result.score}',
                            style: AppTextStyles.heading1(screenWidth).copyWith(
                              fontSize: screenWidth * 0.15,
                              color: AppColors.accentYellow,
                            ),
                          ),

                          Text(
                            'Skor Anda',
                            style: AppTextStyles.bodyLarge(screenWidth),
                          ),

                          SizedBox(height: screenHeight * 0.02),

                          // Stats
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _buildStatItem(
                                context,
                                Icons.check_circle,
                                '${result.correctAnswers}',
                                'Benar',
                                AppColors.correctGreen,
                              ),
                              _buildStatItem(
                                context,
                                Icons.cancel,
                                '${result.wrongAnswers}',
                                'Salah',
                                AppColors.wrongRed,
                              ),
                              _buildStatItem(
                                context,
                                Icons.remove_circle,
                                '${result.skippedAnswers}',
                                'Kosong',
                                AppColors.textSecondary,
                              ),
                            ],
                          ),

                          SizedBox(height: screenHeight * 0.02),

                          // Percentage
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.05,
                              vertical: screenHeight * 0.01,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primaryBlue,
                              borderRadius: BorderRadius.circular(
                                screenWidth * 0.05,
                              ),
                            ),
                            child: Text(
                              'Akurasi: ${result.percentage.toStringAsFixed(1)}%',
                              style: AppTextStyles.bodyMedium(screenWidth).copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Review Title
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.04,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Review Jawaban',
                          style: AppTextStyles.heading2(screenWidth),
                        ),
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.02),

                    // Review List
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.only(bottom: screenHeight * 0.02),
                        itemCount: quizProvider.questions.length,
                        itemBuilder: (context, index) {
                          return ResultCard(
                            question: quizProvider.questions[index],
                            userAnswer: result.userAnswers[index],
                            questionNumber: index + 1,
                          );
                        },
                      ),
                    ),

                    // Buttons
                    Padding(
                      padding: EdgeInsets.all(screenWidth * 0.04),
                      child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: screenHeight * 0.07,
                              child: ElevatedButton(
                                onPressed: () {
                                  quizProvider.resetQuiz();
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomeScreen(),
                                    ),
                                    (route) => false,
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.accentYellow,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      screenWidth * 0.03,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  'Kembali ke Home',
                                  style: AppTextStyles.button(screenWidth).copyWith(
                                    color: AppColors.primaryBlue,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(
    BuildContext context,
    IconData icon,
    String value,
    String label,
    Color color,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Icon(icon, color: color, size: screenWidth * 0.08),
        SizedBox(height: MediaQuery.of(context).size.height * 0.005),
        Text(
          value,
          style: AppTextStyles.heading3(screenWidth).copyWith(color: color),
        ),
        Text(
          label,
          style: AppTextStyles.bodySmall(screenWidth),
        ),
      ],
    );
  }
}