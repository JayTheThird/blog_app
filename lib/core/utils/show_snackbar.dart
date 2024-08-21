// import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

void showSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(message),
        // backgroundColor: AppPallete.gradient3,
      ),
    );
}
