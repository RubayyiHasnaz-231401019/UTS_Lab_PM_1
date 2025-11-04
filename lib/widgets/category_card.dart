import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/category.dart';
import '../providers/theme_provider.dart';
import '../utils/app_colors.dart';
import '../utils/text_styles.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final VoidCallback onTap;

  const CategoryCard({
    super.key,
    required this.category,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final themeProvider = Provider.of<ThemeProvider>(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04,
          vertical: screenHeight * 0.01,
        ),
        padding: EdgeInsets.all(screenWidth * 0.04),
        decoration: BoxDecoration(
          color: themeProvider.cardColor,
          borderRadius: BorderRadius.circular(screenWidth * 0.04),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // Icon
            Container(
              width: screenWidth * 0.12,
              height: screenWidth * 0.12,
              decoration: BoxDecoration(
                color: themeProvider.isDarkMode
                    ? AppColors.primaryBlue
                    : Colors.blue.shade100,
                borderRadius: BorderRadius.circular(screenWidth * 0.03),
              ),
              child: Image.asset(
                category.iconPath,
                width: screenWidth * 0.08,
                height: screenWidth * 0.08,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.rocket_launch,
                    color: themeProvider.isDarkMode
                        ? AppColors.accentYellow
                        : Colors.blue,
                    size: screenWidth * 0.06,
                  );
                },
              ),
            ),

            SizedBox(width: screenWidth * 0.04),

            // Text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.name,
                    style: AppTextStyles.heading3(screenWidth).copyWith(
                      color: themeProvider.textPrimaryColor,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Text(
                    category.description,
                    style: AppTextStyles.bodySmall(screenWidth).copyWith(
                      color: themeProvider.textSecondaryColor,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            // Arrow
            Icon(
              Icons.arrow_forward_ios,
              color: themeProvider.isDarkMode
                  ? AppColors.accentYellow
                  : Colors.blue,
              size: screenWidth * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}