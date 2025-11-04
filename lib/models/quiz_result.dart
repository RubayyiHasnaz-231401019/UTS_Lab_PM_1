class QuizResult {
  final String categoryId;
  final String categoryName;
  final int totalQuestions;
  final int correctAnswers;
  final int wrongAnswers;
  final int skippedAnswers;
  final List<int?> userAnswers;
  final DateTime completedAt;

  QuizResult({
    required this.categoryId,
    required this.categoryName,
    required this.totalQuestions,
    required this.correctAnswers,
    required this.wrongAnswers,
    required this.skippedAnswers,
    required this.userAnswers,
    required this.completedAt,
  });

  int get score => correctAnswers * 20;
  
  double get percentage => (correctAnswers / totalQuestions) * 100;
}