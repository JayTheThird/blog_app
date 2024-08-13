import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final String title;
  const AuthField({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: title,
      ),
    );
  }
}
