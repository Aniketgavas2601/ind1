import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:indiaone/src/image_path/image_path.dart';
import 'package:indiaone/src/screen_constant/screen_constant.dart';
import 'package:indiaone/src/screens/home_screen/home_screen.dart';
import 'package:indiaone/src/screens/home_screen/widgets/custom_navigation_bar.dart';
import 'package:indiaone/src/screens/login_screen/login_screen.dart';
import 'package:indiaone/src/screens/otp_screen/timer_controller.dart';
import 'package:indiaone/src/themes/common_colors.dart';
import 'package:indiaone/src/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EnterOtpSreen extends StatefulWidget {

  String? mobileNumber;

  EnterOtpSreen(this.mobileNumber);

  @override
  State<EnterOtpSreen> createState() => _EnterOtpSreenState();
}

class _EnterOtpSreenState extends State<EnterOtpSreen> {

  final timerController = Get.put(TimerController());

  final FirebaseAuth auth = FirebaseAuth.instance;

  final otpController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImagePath.loginBg), fit: BoxFit.fill)),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: ScreenConstant.screenHeightHalf),
                child: Container(
                  height: ScreenConstant.screenHeightFull * 0.8,
                  //color: Colors.white,
                  decoration: BoxDecoration(
                      color: AppColors.colorWhite,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(ScreenConstant.size60),
                          topRight: Radius.circular(ScreenConstant.size60))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenConstant.size40,
                        vertical: ScreenConstant.size70),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(ImagePath.indiaOne),
                        SizedBox(
                          height: ScreenConstant.size40,
                        ),
                        CustomText(
                          text: 'Enter OTP',
                          fontSize: ScreenConstant.size30,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: ScreenConstant.size6,
                        ),
                        Text.rich(
                          TextSpan(
                            text: 'We have sent an OTP to ',
                            style: TextStyle(
                                fontSize: FontSize.s16,
                                fontWeight: FontWeight.w400),
                            children: <InlineSpan>[
                              WidgetSpan(
                                  alignment: PlaceholderAlignment.baseline,
                                  baseline: TextBaseline.alphabetic,
                                  child: SizedBox(width: ScreenConstant.size6)),
                              TextSpan(
                                text: widget.mobileNumber,
                                style: TextStyle(
                                    fontSize: FontSize.s16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.colorBlack),
                              ),
                              // can add more TextSpans here...
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Pinput(
                                controller: otpController,
                                length: 6,
                                showCursor: true,
                                onChanged: (value) async {
                                  print(value);
                                  try{
                                    if(value.length == 6){
                                      PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: LoginScreen.verify, smsCode: value);
                                      // Sign the user in (or link) with the credential
                                      await auth.signInWithCredential(credential);
                                      SharedPreferences preferences = await SharedPreferences.getInstance();
                                      preferences.setString('otp', value);
                                      Get.to(CustomNavigationBar());
                                    }
                                  }catch (e){
                                    log(e.toString());
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: ScreenConstant.size60,
                        ),
                        Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: 'Edit number',
                                fontSize: FontSize.s16,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff014381),
                              ),
                              Text.rich(
                                TextSpan(
                                  text: 'Resend OTP in',
                                  style: TextStyle(fontSize: FontSize.s16,fontWeight: FontWeight.w500,color: const Color(0xff555555)),
                                  children: <InlineSpan>[
                                    WidgetSpan(
                                        alignment: PlaceholderAlignment.baseline,
                                        baseline: TextBaseline.alphabetic,
                                        child: SizedBox(width: ScreenConstant.size4)),
                                    TextSpan(
                                        text: timerController.time.value,
                                        style: TextStyle(
                                            fontSize: FontSize.s16,
                                            fontWeight: FontWeight.w700,
                                            color: const Color(0xff555555)
                                        )),
                                    // can add more TextSpans here...
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
