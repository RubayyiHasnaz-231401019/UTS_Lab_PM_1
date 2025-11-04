import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../utils/app_colors.dart';
import '../utils/text_styles.dart';
import '../widgets/quiz_header.dart';
import '../widgets/progress_indicator.dart';
import '../widgets/answer_option.dart';
import 'result_screen.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (!didPop) {
          bool shouldExit = await _showExitDialog(context);
          if (shouldExit && context.mounted) {
            Navigator.pop(context);
          }
        }
      },
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
                final question = quizProvider.currentQuestion;
                final userAnswer = quizProvider.getUserAnswer(
                  quizProvider.currentQuestionIndex,
                );

                return Column(
                  children: [
                    // Header
                    QuizHeader(
                      categoryName: quizProvider.currentCategoryName,
                      onBack: () async {
                        bool shouldExit = await _showExitDialog(context);
                        if (shouldExit && context.mounted) {
                          Navigator.pop(context);
                        }
                      },
                    ),

                    // Progress Indicator
                    QuizProgressIndicator(
                      currentQuestion: quizProvider.currentQuestionIndex + 1,
                      totalQuestions: quizProvider.totalQuestions,
                    ),

                    SizedBox(height: screenHeight * 0.03),

                    // Question
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            // Question Text
                            Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.04,
                              ),
                              padding: EdgeInsets.all(screenWidth * 0.05),
                              decoration: BoxDecoration(
                                color: AppColors.cardBackground,
                                borderRadius: BorderRadius.circular(
                                  screenWidth * 0.04,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Text(
                                question.questionText,
                                style: AppTextStyles.heading3(screenWidth),
                                textAlign: TextAlign.center,
                              ),
                            ),

                            SizedBox(height: screenHeight * 0.03),

                            // Answer Options
                            ...List.generate(
                              question.options.length,
                              (index) => AnswerOption(
                                optionLetter: String.fromCharCode(65 + index),
                                optionText: question.options[index],
                                isSelected: userAnswer == index,
                                onTap: () {
                                  quizProvider.answerQuestion(index);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Next Button
                    Container(
                      padding: EdgeInsets.all(screenWidth * 0.04),
                      child: SizedBox(
                        width: double.infinity,
                        height: screenHeight * 0.07,
                        child: ElevatedButton(
                          onPressed: () {
                            if (quizProvider.currentQuestionIndex ==
                                quizProvider.totalQuestions - 1) {
                              // Last question - go to result
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ResultScreen(),
                                ),
                              );
                            } else {
                              // Next question
                              quizProvider.nextQuestion();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.accentYellow,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                screenWidth * 0.03,
                              ),
                            ),
                            elevation: 5,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                quizProvider.currentQuestionIndex ==
                                        quizProvider.totalQuestions - 1
                                    ? 'Selesai'
                                    : 'Selanjutnya',
                                style: AppTextStyles.button(screenWidth).copyWith(
                                  color: AppColors.primaryBlue,
                                ),
                              ),
                              SizedBox(width: screenWidth * 0.02),
                              Icon(
                                Icons.arrow_forward,
                                color: AppColors.primaryBlue,
                                size: screenWidth * 0.06,
                              ),
                            ],
                          ),
                        ),
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

  Future<bool> _showExitDialog(BuildContext context) async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: AppColors.cardBackground,
            title: Text(
              'Keluar dari Quiz?',
              style: AppTextStyles.heading3(
                MediaQuery.of(context).size.width,
              ),
            ),
            content: Text(
              'Progress Anda akan hilang. Yakin ingin keluar?',
              style: AppTextStyles.bodyMedium(
                MediaQuery.of(context).size.width,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text(
                  'Tidak',
                  style: TextStyle(color: AppColors.accentYellow),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: Text(
                  'Ya',
                  style: TextStyle(color: AppColors.wrongRed),
                ),
              ),
            ],
          ),
        ) ??
        false;
  }
}