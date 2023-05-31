import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:indiaone/src/image_path/image_path.dart';
import 'package:indiaone/src/screen_constant/screen_constant.dart';
import 'package:indiaone/src/widgets/custom_text.dart';

class CustomReferCard{
  Widget customRefferalCard(){
    return Container(
      height: ScreenConstant.size130,
      width: ScreenConstant.screenWidthFull,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ScreenConstant.size12),
        gradient: LinearGradient(
          end: Alignment.bottomRight,
          begin: Alignment.topLeft,
          colors: [
            Color(0xff004280),
            Color(0xff004280),
            Color(0xffED1C24).withOpacity(0.8),
        ],),
      ),
      child: Container(
        padding: EdgeInsets.only(left: ScreenConstant.size16,right: ScreenConstant.size6,top: ScreenConstant.size26,bottom: ScreenConstant.size26),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: 'Refer a friend or a family member & get',color: Color(0xffEBEBEB),fontSize: FontSize.s14,fontWeight: FontWeight.w400,),
                //verticalSpace(height: ScreenConstant.size10),
                Text.rich(
                  TextSpan(
                    text: 'a chance to',
                    style: TextStyle(
                        fontSize: FontSize.s14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xffEBEBEB),
                        fontFamily: 'Graphik'),
                    children: <InlineSpan>[
                      WidgetSpan(
                          alignment: PlaceholderAlignment.baseline,
                          baseline: TextBaseline.alphabetic,
                          child: SizedBox(width: ScreenConstant.size6)),
                      TextSpan(
                        text: 'Earn upto 100 points',
                        style: TextStyle(
                            fontSize: FontSize.s18,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xffEBEBEB),
                            fontFamily: 'Graphik'),
                      ),
                      // can add more TextSpans here...
                    ],
                  ),
                  textScaleFactor: 1,
                ),
                //verticalSpace(height: ScreenConstant.size20),
                Row(
                  children: [
                    CustomText(text: 'Refer Now',color: Color(0xffFFEE48),fontSize: FontSize.s14,fontWeight: FontWeight.w600,),
                    horizontalSpace(width: ScreenConstant.size10),
                    SvgPicture.asset(ImagePath.arrowIcon)
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Image.asset(ImagePath.giftBox)
              ],
            )
          ],
        ),
      ),
    );
  }
}