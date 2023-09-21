import 'package:flutter/material.dart';

import '../../theme/my_theme.dart';

class AppHeadingCard extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;

  AppHeadingCard({
    super.key,
    required this.child,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30)),
          gradient: LinearGradient(
            colors: <Color>[
              MyColors.greyColor1,
              MyColors.greyColor2,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.5),
              blurRadius: 1.5,
            ),
          ]),
      child: Padding(padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),child: Material(
        color: Colors.transparent,
        child: child,
      ),),
    );
  }
}
