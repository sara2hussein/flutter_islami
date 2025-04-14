import 'package:flutter/material.dart';
import 'package:flutter_islami/utils/app_colors.dart';
import 'package:flutter_islami/utils/app_styles.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    canvasColor: AppColors.primaryColor,
    textTheme: TextTheme(
      headlineLarge: AppStyles.bold16White,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.blackBgColor,
      titleTextStyle: AppStyles.bold20White,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: AppColors.primaryColor,
      ),
    ),
  );
}
