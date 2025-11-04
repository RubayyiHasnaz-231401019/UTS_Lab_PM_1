import 'package:flutter/material.dart';
import '../models/quiz_result.dart';

class UserProvider extends ChangeNotifier {
  String _userName = '';
  List<QuizResult> _quizHistory = [];
  int _totalScore = 0;
  int _totalQuizzesTaken = 0;

  // Getters
  String get userName => _userName;
  List<QuizResult> get quizHistory => _quizHistory;
  int get totalScore => _totalScore;
  int get totalQuizzesTaken => _totalQuizzesTaken;

  // Set username
  void setUserName(String name) {
    _userName = name;
    notifyListeners();
  }

  // Add quiz result
  void addQuizResult(QuizResult result) {
    _quizHistory.add(result);
    _totalScore += result.score;
    _totalQuizzesTaken++;
    notifyListeners();
  }

  // Get favorite category (category with highest score, or most played if tied)
  String? get favoriteCategory {
    if (_quizHistory.isEmpty) return null;
    
    // Group by category and calculate total score + count
    Map<String, Map<String, dynamic>> categoryStats = {};
    
    for (var result in _quizHistory) {
      if (!categoryStats.containsKey(result.categoryName)) {
        categoryStats[result.categoryName] = {
          'totalScore': 0,
          'count': 0,
        };
      }
      categoryStats[result.categoryName]!['totalScore'] += result.score;
      categoryStats[result.categoryName]!['count'] += 1;
    }
    
    // Find category with highest score
    String favorite = '';
    int highestScore = 0;
    int highestCount = 0;
    
    categoryStats.forEach((categoryName, stats) {
      int score = stats['totalScore'] as int;
      int count = stats['count'] as int;
      
      // If score is higher, or same score but played more times
      if (score > highestScore || (score == highestScore && count > highestCount)) {
        favorite = categoryName;
        highestScore = score;
        highestCount = count;
      }
    });
    
    return favorite;
  }

  // Get total quizzes by category
  int getQuizCountByCategory(String categoryId) {
    return _quizHistory
        .where((result) => result.categoryId == categoryId)
        .length;
  }

  // Get average score
  double get averageScore {
    if (_totalQuizzesTaken == 0) return 0;
    return _totalScore / _totalQuizzesTaken;
  }

  // Get total score by category
  int getTotalScoreByCategory(String categoryId) {
    int total = 0;
    for (var result in _quizHistory) {
      if (result.categoryId == categoryId) {
        total += result.score;
      }
    }
    return total;
  }

  // Get highest score in single quiz
  int get highestScore {
    if (_quizHistory.isEmpty) return 0;
    return _quizHistory.map((r) => r.score).reduce((a, b) => a > b ? a : b);
  }

  // Get total correct answers
  int get totalCorrectAnswers {
    return _quizHistory.fold(0, (sum, result) => sum + result.correctAnswers);
  }

  // Reset user data
  void resetUserData() {
    _userName = '';
    _quizHistory = [];
    _totalScore = 0;
    _totalQuizzesTaken = 0;
    notifyListeners();
  }
}