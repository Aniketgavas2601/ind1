import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final double? height;
  final VoidCallback onTap;
  final Widget? child;
  final Color? color;
  final double? radius;


  CustomButton({this.height,required this.onTap,this.child,this.color,this.radius});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius!)
        ),
        child: child,
      ),
    );
  }
}
