import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:indiaone/src/screen_constant/screen_constant.dart';
import 'package:indiaone/src/widgets/custom_text.dart';

class HeadingContainer extends StatelessWidget {
  final String? text;
  final String? image;
  final IconData? icon;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;
  final VoidCallback? onTap;

  HeadingContainer(
      {this.text, this.image, this.icon, this.color, this.borderRadius, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: ScreenConstant.size30,
        height: ScreenConstant.size30,
        decoration: BoxDecoration(
          color: color ?? Colors.white,
          borderRadius:  borderRadius ?? BorderRadius.circular(6),
        ),
        child: text != null
            ? Center(
                child: Text(
                  text!,
                  style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: FontSize.s16,
                      fontWeight: FontWeight.w400,
                  ),
                ),
              )
            : image != null
                ? Center(
                    child: SvgPicture.asset(image!),
                  )
                : Icon(icon),
      ),
    );
  }
}
