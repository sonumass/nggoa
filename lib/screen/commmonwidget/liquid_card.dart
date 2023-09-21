import 'package:flutter/material.dart';

import '../../theme/my_theme.dart';

class ModuleCard extends StatelessWidget {
  final String buttonText;
  final double width;
  final double height;
  final VoidCallback? onPressed;

   const ModuleCard({super.key,
     required this.buttonText,
    this.width = double.infinity,
    this.height = 50.0,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(borderRadius:  BorderRadius.circular(10),gradient:const  LinearGradient(
        colors: <Color>[ Colors.deepPurple,Colors.purpleAccent,],
      ), boxShadow: const [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(0.0, 1.5),
          blurRadius: 1.5,
        ),
      ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: onPressed,
            child:  Center(
              child:  Text(
                buttonText,
                style: const TextStyle(color: Colors.white),
              ),
            )),
      ),
    );
  }
}