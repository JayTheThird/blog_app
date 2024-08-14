import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static _border([Color color = AppPallete.borderColor]) => OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      );

  static final _errorBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      color: Color.fromARGB(239, 244, 67, 54),
      width: 2,
    ),
    borderRadius: BorderRadius.circular(10),
  );

  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPallete.backgroundColor,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(20),
      enabledBorder: _border(),
      focusedBorder: _border(AppPallete.gradient3),
      errorBorder: _errorBorder, // pending to add shade
      focusedErrorBorder: _border(AppPallete.gradient3),
      errorStyle: TextStyle(
        color: Colors.red[300],
      ),
    ),
  );
}
