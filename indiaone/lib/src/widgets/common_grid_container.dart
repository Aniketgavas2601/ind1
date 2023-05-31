import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:indiaone/src/screen_constant/screen_constant.dart';

class GridContainer extends StatelessWidget {
  List<Color>? colors;
  double? horizontalSpace;
  double? verticalSpace;
  double? height;
  double? width;
  double? borderRadius;
  Widget? child;
  String? image;
  String? text;
  double? fontSize;
  Color? fontColor;
  double? textScale;

  GridContainer({this.colors,
    this.horizontalSpace,
    this.verticalSpace,
    this.height,
    this.width,
    this.borderRadius,
    this.child,
    this.image,
    this.text,
    this.fontSize,
    this.fontColor,
    this.textScale});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.black,
      padding: EdgeInsets.symmetric(
          horizontal: horizontalSpace ?? ScreenConstant.size4,
          vertical: verticalSpace ?? ScreenConstant.size12),
      height: height ?? ScreenConstant.size100,
      width: width ?? ScreenConstant.size130,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: colors ?? [const Color(0xffEBF8FF), const Color(0xffF8F9FB)]),
          //color: Colors.lightBlue,
          borderRadius:
          BorderRadius.circular(borderRadius ?? ScreenConstant.size10)),
      child: SafeArea(
        child: child ??
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(image ?? ''),
                Text(
                  text ?? '',
                  style: TextStyle(
                      fontSize: fontSize ?? FontSize.s14,
                      color: fontColor ?? const Color(0xff2D2D2D),
                      fontWeight: FontWeight.w400
                  ),
                  textScaleFactor: textScale ?? 1,
                )
              ],
            ),
      ),
    );
  }
}
