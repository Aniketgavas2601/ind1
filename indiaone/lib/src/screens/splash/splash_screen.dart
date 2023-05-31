import 'dart:async';
import 'package:flutter/material.dart';
import 'package:indiaone/src/image_path/image_path.dart';
import 'package:indiaone/src/screen_constant/screen_constant.dart';
import 'package:indiaone/src/screens/home_screen/widgets/custom_navigation_bar.dart';
import 'package:indiaone/src/screens/select_language/select_lang_screen.dart';
import 'package:indiaone/src/themes/common_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  String? isLoggedIn;

  @override
  void initState() {
    super.initState();
    getValidate().whenComplete(() async {
      Timer(Duration(seconds: 7), () {
        Get.to(isLoggedIn == null ? SelectLangScreen() : CustomNavigationBar());
      });
    });
    // Future.delayed(const Duration(seconds: 7)).then((value) =>
    // Navigator.push(context, MaterialPageRoute(builder: (context) => SelectLangScreen()))
    // );
  }

  Future getValidate() async {
    final SharedPreferences preference = await SharedPreferences.getInstance();
    String? isLoggedInStatus = preference.getString('otp');
    setState(() {
      isLoggedIn = isLoggedInStatus;
    });
    print(isLoggedIn);
  }

  @override
  Widget build(BuildContext context) {
    ScreenConstant.setScreenAwareConstant(context);
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      body: SizedBox(
        height: ScreenConstant.screenHeightFull,
        width: ScreenConstant.screenWidthFull,
        child: Center(
          child: Image.asset(ImagePath.splashImage),
        ),
      ),
    );
  }
}
