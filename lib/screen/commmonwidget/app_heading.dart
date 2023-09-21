import 'package:flutter/material.dart';

import '../../theme/my_theme.dart';

class AppHeadingLabel extends StatelessWidget {
  final String label;
  final Color color;


   const AppHeadingLabel({super.key,
     required this.label,
    this.color = MyColors.kColorBlack,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontFamily: "assets/font/Roboto-Bold.ttf",
        fontWeight: FontWeight.w700,
        color: color,
        fontSize: size_22,
        letterSpacing: 0.27,
        height: 0.9,
      ),
    );
  }
}