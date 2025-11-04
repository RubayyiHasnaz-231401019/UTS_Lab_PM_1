class AppConstants {
  // App Info
  static const String appName = 'AstroQuest';
  static const String appVersion = '1.0.0';
  static const String appDescription = 'Test pengetahuan astronomi Anda!';
  
  // Quiz Settings
  static const int questionsPerCategory = 5;
  static const int pointsPerCorrectAnswer = 20;
  static const int maxScore = 100;
  
  // Animation Durations
  static const int splashDuration = 2; // seconds
  static const int animationDuration = 300; // milliseconds
  
  // Asset Paths
  static const String iconCategoriesPath = 'assets/icons/categories/';
  static const String iconNavigationPath = 'assets/icons/navigation/';
  static const String iconUIPath = 'assets/icons/ui/';
  static const String imagesPath = 'assets/images/';
  
  // Routes
  static const String splashRoute = '/';
  static const String welcomeRoute = '/welcome';
  static const String homeRoute = '/home';
  static const String quizRoute = '/quiz';
  static const String resultRoute = '/result';
  static const String profileRoute = '/profile';
}