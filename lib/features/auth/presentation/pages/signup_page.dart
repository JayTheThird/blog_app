import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:blog_app/core/theme/spacing.dart';
import 'package:blog_app/features/auth/presentation/widgets/auth_field.dart';
import 'package:blog_app/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Sign up.",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacing.gep10,
            const AuthField(title: "Username"),
            Spacing.gep15,
            const AuthField(title: "Email"),
            Spacing.gep15,
            const AuthField(title: "Password"),
            Spacing.gep20,
            const AuthGradientButton(),
            Spacing.gep20,
            Text.rich(
              TextSpan(
                text: "Don't Have an Account? ",
                style: Theme.of(context).textTheme.titleMedium,
                children: [
                  TextSpan(
                    text: "Sign in.",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppPallete.gradient3,
                          fontSize: 20,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
