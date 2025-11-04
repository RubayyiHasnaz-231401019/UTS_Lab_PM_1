import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../providers/theme_provider.dart';
import '../utils/app_colors.dart';
import '../utils/text_styles.dart';
import '../widgets/bottom_nav_bar.dart';
import 'home_screen.dart';
import 'welcome_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _currentIndex = 1;

  void _onNavTap(int index) {
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  void _showEditNameDialog(BuildContext context, String currentName) {
    final TextEditingController controller = TextEditingController(text: currentName);
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.cardBackground,
        title: Text(
          'Edit Nama',
          style: AppTextStyles.heading3(MediaQuery.of(context).size.width),
        ),
        content: TextField(
          controller: controller,
          style: AppTextStyles.bodyMedium(MediaQuery.of(context).size.width),
          decoration: InputDecoration(
            labelText: 'Nama Baru',
            labelStyle: AppTextStyles.bodySmall(MediaQuery.of(context).size.width),
            filled: true,
            fillColor: AppColors.primaryBlue,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Batal',
              style: TextStyle(color: AppColors.textSecondary),
            ),
          ),
          TextButton(
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                Provider.of<UserProvider>(context, listen: false)
                    .setUserName(controller.text.trim());
                Navigator.pop(context);
              }
            },
            child: Text(
              'Simpan',
              style: TextStyle(color: AppColors.accentYellow),
            ),
          ),
        ],
      ),
    );
  }

  void _showResetDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.cardBackground,
        title: Text(
          'Reset Data',
          style: AppTextStyles.heading3(MediaQuery.of(context).size.width),
        ),
        content: Text(
          'Semua data quiz Anda akan dihapus. Yakin ingin melanjutkan?',
          style: AppTextStyles.bodyMedium(MediaQuery.of(context).size.width),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Batal',
              style: TextStyle(color: AppColors.textSecondary),
            ),
          ),
          TextButton(
            onPressed: () {
              Provider.of<UserProvider>(context, listen: false).resetUserData();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const WelcomeScreen()),
                (route) => false,
              );
            },
            child: Text(
              'Reset',
              style: TextStyle(color: AppColors.wrongRed),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final userProvider = Provider.of<UserProvider>(context);
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
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.02),

                  // Profile Header
                  Text(
                    'Profile',
                    style: AppTextStyles.heading1(screenWidth).copyWith(
                      color: themeProvider.textPrimaryColor,
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.03),

                  // Profile Picture
                  Container(
                    width: screenWidth * 0.3,
                    height: screenWidth * 0.3,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.accentYellow.withOpacity(0.2),
                      border: Border.all(
                        color: AppColors.accentYellow,
                        width: 3,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.accentYellow.withOpacity(0.3),
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.person,
                      size: screenWidth * 0.15,
                      color: AppColors.accentYellow,
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.02),

                  // Username
                  Text(
                    userProvider.userName,
                    style: AppTextStyles.heading2(screenWidth).copyWith(
                      color: themeProvider.textPrimaryColor,
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.01),

                  Text(
                    'Space Explorer',
                    style: AppTextStyles.bodyMedium(screenWidth).copyWith(
                      color: themeProvider.textSecondaryColor,
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.04),

                  // Stats Cards
                  Row(
                    children: [
                      Expanded(
                        child: _buildStatCard(
                          context,
                          Icons.quiz,
                          '${userProvider.totalQuizzesTaken}',
                          'Quiz Selesai',
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.04),
                      Expanded(
                        child: _buildStatCard(
                          context,
                          Icons.star,
                          '${userProvider.totalScore}',
                          'Total Skor',
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: screenHeight * 0.02),

                  Row(
                    children: [
                      Expanded(
                        child: _buildStatCard(
                          context,
                          Icons.trending_up,
                          userProvider.totalQuizzesTaken > 0
                              ? '${userProvider.averageScore.toStringAsFixed(1)}'
                              : '0',
                          'Rata-rata',
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.04),
                      Expanded(
                        child: _buildStatCard(
                          context,
                          Icons.emoji_events,
                          userProvider.favoriteCategory ?? '-',
                          'Favorit',
                          isLongText: true,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: screenHeight * 0.04),

                  // Action Buttons
                  _buildActionButton(
                    context,
                    Icons.edit,
                    'Edit Nama',
                    'Ubah nama pengguna Anda',
                    () => _showEditNameDialog(context, userProvider.userName),
                  ),

                  SizedBox(height: screenHeight * 0.02),

                  _buildActionButton(
                    context,
                    Icons.refresh,
                    'Reset Data',
                    'Hapus semua progress quiz',
                    () => _showResetDialog(context),
                    isDestructive: true,
                  ),

                  SizedBox(height: screenHeight * 0.02),

                  // App Info
                  Container(
                    padding: EdgeInsets.all(screenWidth * 0.04),
                    decoration: BoxDecoration(
                      color: themeProvider.isDarkMode
                          ? AppColors.cardBackground.withOpacity(0.5)
                          : Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(screenWidth * 0.03),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.rocket_launch,
                              color: AppColors.accentYellow,
                              size: screenWidth * 0.05,
                            ),
                            SizedBox(width: screenWidth * 0.02),
                            Text(
                              'AstroQuest v1.0.0',
                              style: AppTextStyles.bodySmall(screenWidth).copyWith(
                                color: themeProvider.textSecondaryColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.02),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onNavTap,
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    IconData icon,
    String value,
    String label, {
    bool isLongText = false,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Container(
      padding: EdgeInsets.all(screenWidth * 0.04),
      decoration: BoxDecoration(
        color: themeProvider.cardColor,
        borderRadius: BorderRadius.circular(screenWidth * 0.03),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: AppColors.accentYellow,
            size: screenWidth * 0.08,
          ),
          SizedBox(height: screenHeight * 0.01),
          Text(
            value,
            style: AppTextStyles.heading3(screenWidth).copyWith(
              fontSize: isLongText ? screenWidth * 0.035 : screenWidth * 0.05,
              color: themeProvider.textPrimaryColor,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: screenHeight * 0.005),
          Text(
            label,
            style: AppTextStyles.bodySmall(screenWidth).copyWith(
              color: themeProvider.textSecondaryColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle,
    VoidCallback onTap, {
    bool isDestructive = false,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final themeProvider = Provider.of<ThemeProvider>(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(screenWidth * 0.04),
        decoration: BoxDecoration(
          color: themeProvider.cardColor,
          borderRadius: BorderRadius.circular(screenWidth * 0.03),
          border: Border.all(
            color: isDestructive
                ? AppColors.wrongRed.withOpacity(0.3)
                : Colors.transparent,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(screenWidth * 0.03),
              decoration: BoxDecoration(
                color: isDestructive
                    ? AppColors.wrongRed.withOpacity(0.2)
                    : AppColors.accentYellow.withOpacity(0.2),
                borderRadius: BorderRadius.circular(screenWidth * 0.02),
              ),
              child: Icon(
                icon,
                color: isDestructive ? AppColors.wrongRed : AppColors.accentYellow,
                size: screenWidth * 0.06,
              ),
            ),
            SizedBox(width: screenWidth * 0.04),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.bodyMedium(screenWidth).copyWith(
                      fontWeight: FontWeight.bold,
                      color: themeProvider.textPrimaryColor,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: AppTextStyles.bodySmall(screenWidth).copyWith(
                      color: themeProvider.textSecondaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: themeProvider.textSecondaryColor,
              size: screenWidth * 0.04,
            ),
          ],
        ),
      ),
    );
  }
}