import 'package:flutter/material.dart';
import '../models/question.dart';
import '../models/quiz_result.dart';
import '../data/questions_data.dart';

class QuizProvider extends ChangeNotifier {
  String _currentCategoryId = '';
  String _currentCategoryName = '';
  List<Question> _questions = [];
  int _currentQuestionIndex = 0;
  List<int?> _userAnswers = [];
  bool _isQuizCompleted = false;

  // Getters
  String get currentCategoryId => _currentCategoryId;
  String get currentCategoryName => _currentCategoryName;
  List<Question> get questions => _questions;
  int get currentQuestionIndex => _currentQuestionIndex;
  List<int?> get userAnswers => _userAnswers;
  bool get isQuizCompleted => _isQuizCompleted;
  int get totalQuestions => _questions.length;

  Question get currentQuestion => _questions[_currentQuestionIndex];

  // Start quiz
  void startQuiz(String categoryId, String categoryName) {
    _currentCategoryId = categoryId;
    _currentCategoryName = categoryName;
    _questions = QuestionsData.getQuestionsByCategory(categoryId);
    _currentQuestionIndex = 0;
    _userAnswers = List.filled(_questions.length, null);
    _isQuizCompleted = false;
    notifyListeners();
  }

  // Answer current question
  void answerQuestion(int answerIndex) {
    if (_currentQuestionIndex < _questions.length) {
      _userAnswers[_currentQuestionIndex] = answerIndex;
      notifyListeners();
    }
  }

  // Go to next question
  void nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      _currentQuestionIndex++;
      notifyListeners();
    } else {
      _isQuizCompleted = true;
      notifyListeners();
    }
  }

  // Go to previous question
  void previousQuestion() {
    if (_currentQuestionIndex > 0) {
      _currentQuestionIndex--;
      notifyListeners();
    }
  }

  // Get quiz result
  QuizResult getQuizResult() {
    int correct = 0;
    int wrong = 0;
    int skipped = 0;

    for (int i = 0; i < _questions.length; i++) {
      if (_userAnswers[i] == null) {
        skipped++;
      } else if (_userAnswers[i] == _questions[i].correctAnswerIndex) {
        correct++;
      } else {
        wrong++;
      }
    }

    return QuizResult(
      categoryId: _currentCategoryId,
      categoryName: _currentCategoryName,
      totalQuestions: _questions.length,
      correctAnswers: correct,
      wrongAnswers: wrong,
      skippedAnswers: skipped,
      userAnswers: _userAnswers,
      completedAt: DateTime.now(),
    );
  }

  // Reset quiz
  void resetQuiz() {
    _currentCategoryId = '';
    _currentCategoryName = '';
    _questions = [];
    _currentQuestionIndex = 0;
    _userAnswers = [];
    _isQuizCompleted = false;
    notifyListeners();
  }

  // Check if current question is answered
  bool isCurrentQuestionAnswered() {
    return _userAnswers[_currentQuestionIndex] != null;
  }

  // Get user answer for specific question
  int? getUserAnswer(int questionIndex) {
    return _userAnswers[questionIndex];
  }
}