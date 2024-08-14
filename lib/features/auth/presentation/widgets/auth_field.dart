import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final String title;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool isObscureText;

  const AuthField({
    super.key,
    required this.title,
    this.isObscureText = false,
    this.validator,
    this.controller,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: title,
      ),
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isObscureText,
      cursorColor: AppPallete.whiteColor,
      cursorWidth: 1.6,
    );
  }
}
