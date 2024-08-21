import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitPianoWave(
        color: AppPallete.gradient3,
        size: 50,
      ),
    );
  }
}
