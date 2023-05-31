import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:indiaone/src/enums/enum.dart';
import 'package:indiaone/src/image_path/image_path.dart';
import 'package:indiaone/src/screen_constant/screen_constant.dart';
import 'package:indiaone/src/screens/home_screen/controller/page_controller.dart';
import 'package:indiaone/src/screens/home_screen/home_screen.dart';
import 'package:indiaone/src/screens/home_screen/pages/insurance_page.dart';
import 'package:indiaone/src/screens/home_screen/pages/loan_page.dart';
import 'package:indiaone/src/screens/home_screen/pages/payment_page.dart';
import 'package:indiaone/src/screens/home_screen/pages/saving_page.dart';
import 'package:indiaone/src/widgets/custom_text.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomNavigationBar extends StatefulWidget {

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  final pageController = Get.put(PageChange());

  LocalAuthentication authentication = LocalAuthentication();

  bool isAuth = true;

  bool? isAuthenticated;

  Future<void> _checkBio() async {
    try {
      List<BiometricType> availableBiometric =
      await authentication.getAvailableBiometrics();
      if (availableBiometric.isEmpty) {
        bool password = await authentication.authenticate(
            localizedReason: 'authenticate using pin/pattern/passcode',
            options: const AuthenticationOptions(biometricOnly: false));
        if (password) {
          print('authentication successful');
          print('11111111111');
          SharedPreferences preference = await SharedPreferences.getInstance();
          preference.setBool('authResult', true);

        }
      }
    } catch (e) {
      if (e.toString().contains('NotAvailable')) {
        authentication.stopAuthentication();
      }
    }
  }

  final pages = [
    HomeScreen(),
    LoanPage(),
    PaymentPage(),
    InsurancePage(),
    SavingPage()
  ];

  @override
  void initState() {
    super.initState();
    _checkBio();
    bottomBar();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: pages[pageController.currentPage.value],
        bottomNavigationBar: bottomBar(),
      ),
    );
  }

  Widget bottomBar(){
    return Container(
      padding: const EdgeInsets.only(right: 5,left: 5),
      width: ScreenConstant.screenWidthFull,
      height: ScreenConstant.size80,
      decoration: BoxDecoration(
        //color: Colors.redAccent,
          borderRadius: BorderRadius.vertical(top: Radius.circular(10))
      ),
      child: Obx(
            () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () async {
                pageController.changeTab(PageType.home.index);
              },
              child: Stack(
                children: [
                  Positioned(
                      top: 10,
                      child: Container(decoration: BoxDecoration(color: Colors.black,shape: BoxShape.circle),)),
                  Container(
                    color: Colors.blue,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        pageController.currentPage.value == 0 ?
                        Container(
                          //color: Colors.blue,
                          // height: 24,
                          //   width: 24,
                            decoration: BoxDecoration(
                              //color: Colors.black,
                                borderRadius: BorderRadius.vertical(top: Radius.circular(10))
                            ),
                            child: SvgPicture.asset(ImagePath.circleIcon)) : Container(),
                        SvgPicture.asset(ImagePath.homeNavbarIcon),
                        CustomText(text: 'Home',color: Colors.black,fontSize: FontSize.s10,fontWeight: FontWeight.w500,),
                        pageController.currentPage.value == 0 ? SvgPicture.asset(ImagePath.lineNavbarIcon,) : Container()
                      ],
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () async {
                pageController.changeTab(PageType.loan.index);
              },
              child: Container(
                color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    pageController.currentPage.value == 1 ? SvgPicture.asset(ImagePath.circleIcon) : Container(),
                    SvgPicture.asset(ImagePath.loanNavbarIcon),
                    CustomText(text: 'Loans',color: Colors.black,fontSize: FontSize.s10,fontWeight: FontWeight.w500,),
                    pageController.currentPage.value == 1 ? SvgPicture.asset(ImagePath.lineNavbarIcon) : Container()
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                pageController.changeTab(PageType.payment.index);
              },
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    pageController.currentPage.value == 2 ? SvgPicture.asset(ImagePath.circleIcon) : Container(),
                    SvgPicture.asset(ImagePath.paymentNavbarIcon),
                    CustomText(text: 'Payments',color: Colors.black,fontSize: FontSize.s10,fontWeight: FontWeight.w500,),
                    pageController.currentPage.value == 2 ? SvgPicture.asset(ImagePath.lineNavbarIcon) : Container()
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                pageController.changeTab(PageType.insurance.index);
              },
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    pageController.currentPage.value == 3 ? SvgPicture.asset(ImagePath.circleIcon) : Container(),
                    SvgPicture.asset(ImagePath.insuranceNavbarIcon),
                    CustomText(text: 'Insurance',color: Colors.black,fontSize: FontSize.s10,fontWeight: FontWeight.w500,),
                    pageController.currentPage.value == 3 ? SvgPicture.asset(ImagePath.lineNavbarIcon) : Container()
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                pageController.changeTab(PageType.saving.index);
              },
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    pageController.currentPage.value == 4 ? SvgPicture.asset(ImagePath.circleIcon) : Container(),
                    SvgPicture.asset(ImagePath.savingNavbarIcon),
                    CustomText(text: 'Savings',color: Colors.black,fontSize: FontSize.s10,fontWeight: FontWeight.w500,),
                    pageController.currentPage.value == 4 ? SvgPicture.asset(ImagePath.lineNavbarIcon) : Container()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
