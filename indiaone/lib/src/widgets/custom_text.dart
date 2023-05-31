import 'package:flutter/material.dart';
import 'package:indiaone/src/screen_constant/screen_constant.dart';
import 'package:indiaone/src/themes/common_colors.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final TextAlign? textAlign;

  CustomText(
      {required this.text,
      this.style,
      this.color,
      this.fontSize,
      this.fontWeight,
      this.fontFamily,
      this.textAlign,
      });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ??
          TextStyle(
              color: color ?? AppColors.colorBlack,
              fontSize: fontSize ?? FontSize.s10,
              fontWeight: fontWeight ?? FontWeight.w500,
              fontFamily: 'Graphik',
          ),
      textAlign: textAlign ?? TextAlign.center,
      textScaleFactor: 1,
    );
  }
}
