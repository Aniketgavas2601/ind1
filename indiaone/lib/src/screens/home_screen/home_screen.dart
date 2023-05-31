import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:indiaone/src/enums/enum.dart';
import 'package:indiaone/src/image_path/image_path.dart';
import 'package:indiaone/src/screen_constant/screen_constant.dart';
import 'package:indiaone/src/services/notification_service.dart';
import 'package:indiaone/src/texts/texts.dart';
import 'package:indiaone/src/themes/common_colors.dart';
import 'package:indiaone/src/widgets/common_grid_container.dart';
import 'package:indiaone/src/widgets/common_heading_container.dart';
import 'package:indiaone/src/widgets/custom_text.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  ProfileMenu? selectMenu;

  LocalAuthentication authentication = LocalAuthentication();

  bool isAuth = true;

  bool? isAuthenticated;

  NotificationService notificationService = NotificationService();

  @override
  void initState() {
    super.initState();
    notificationService.initializeNotifications();
  }

  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addObserver(this);
  //   print('initstate');
  //   //checkIsAuthenticate();
  //
  // }
  //
  // Future checkIsAuthenticate() async {
  //   // SharedPreferences preference = await SharedPreferences.getInstance();
  //   // bool? value = preference.getBool('authResult');
  //   // print(value);
  //
  //
  //   // if (value != null) {
  //   //   if (value) {
  //   //     //_checkBio();
  //   //   }
  //   //   else{
  //   //    _checkBio();
  //   //   }
  //   // } else {
  //   //   _checkBio();
  //   // }
  //
  //
  // }
  //
  // Future<void> _checkBio() async {
  //   try {
  //     List<BiometricType> availableBiometric =
  //         await authentication.getAvailableBiometrics();
  //     if (availableBiometric.isEmpty) {
  //       bool password = await authentication.authenticate(
  //           localizedReason: 'authenticate using pin/pattern/passcode',
  //           options: const AuthenticationOptions(biometricOnly: false));
  //       if (password) {
  //         print('authentication successful');
  //         print('11111111111');
  //         SharedPreferences preference = await SharedPreferences.getInstance();
  //         preference.setBool('authResult', true);
  //
  //       }
  //     }
  //   } catch (e) {
  //     if (e.toString().contains('NotAvailable')) {
  //       authentication.stopAuthentication();
  //     }
  //   }
  // }
  //
  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) async {
  //   super.didChangeAppLifecycleState(state);
  //   if (state == AppLifecycleState.resumed) {
  //     if (!isAuth) {
  //       _checkBio();
  //     }
  //     setState(() {
  //       print('555555555');
  //       isAuth = true;
  //     });
  //     print('222222222222');
  //     print('resumed');
  //   } else if (state == AppLifecycleState.paused) {
  //     print('3333333333');
  //     print('paused');
  //   } else if (state == AppLifecycleState.inactive) {
  //     print('inactive');
  //   } else if (state == AppLifecycleState.detached) {
  //     print('detached');
  //   }
  // }
  //
  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   _checkBio();
  // }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  //decoration: const BoxDecoration(color: Colors.white),
                  child: Stack(
                    children: [
                      Container(
                        height: ScreenConstant.size400,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(ImagePath.homeBg),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: ScreenConstant.size20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: ScreenConstant.size66,
                                    width: ScreenConstant.size66,
                                    decoration: const BoxDecoration(
                                        color: AppColors.colorWhite,
                                        shape: BoxShape.circle),
                                    child: Center(
                                        child: SvgPicture.asset(
                                            ImagePath.indiaOneCircleLogo)),
                                  ),
                                  SvgPicture.asset(ImagePath.design),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      HeadingContainer(
                                        text: 'Aa',
                                      ),
                                      horizontalSpace(
                                          width: ScreenConstant.size8),
                                      HeadingContainer(
                                        image: ImagePath.bellIcon,
                                        onTap: (){
                                          notificationService.sendNotification('this is a title', 'this is a body');
                                        },
                                      ),
                                      horizontalSpace(
                                          width: ScreenConstant.size1),
                                      PopupMenuButton<ProfileMenu>(
                                        position: PopupMenuPosition.under,
                                        elevation: 3,
                                        //padding: EdgeInsets.only(right: 2),
                                        icon: HeadingContainer(
                                          image: ImagePath.profileIcon,
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(
                                                    ScreenConstant.size10),
                                                bottomLeft: Radius.circular(
                                                    ScreenConstant.size10),
                                                bottomRight: Radius.circular(
                                                    ScreenConstant.size10))),
                                        color: const Color(0xffFFFFFF),
                                        initialValue: selectMenu,
                                        itemBuilder: (context) =>
                                            <PopupMenuEntry<ProfileMenu>>[
                                          const PopupMenuItem(
                                              value: ProfileMenu.myProfile,
                                              child: Text(
                                                'My Profile',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xff2D2D2D)),
                                              )),
                                          const PopupMenuDivider(),
                                          const PopupMenuItem(
                                              value: ProfileMenu.myProfile,
                                              child: Text(
                                                'My Rewards',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xff2D2D2D)),
                                              )),
                                          PopupMenuItem(
                                              child: IconButton(
                                                  onPressed: () async {
                                                    SharedPreferences
                                                        preference =
                                                        await SharedPreferences
                                                            .getInstance();
                                                    preference.remove('otp');
                                                  },
                                                  icon: Icon(Icons.logout)))
                                        ],
                                      ),
                                      // HeadingContainer(
                                      //   onTap: (){
                                      //     print('1111');
                                      //     popupButton();
                                      //   },
                                      //   image: ImagePath.profileIcon,
                                      // ),
                                    ],
                                  )
                                ],
                              ),
                              verticalSpace(height: ScreenConstant.size14),
                              CustomText(
                                text: Texts.welcomeMsg,
                                fontSize: FontSize.s14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.colorWhite,
                              ),
                              verticalSpace(height: ScreenConstant.size12),
                              CustomText(
                                text: Texts.summaryText,
                                fontSize: FontSize.s18,
                                fontWeight: FontWeight.w500,
                                color: AppColors.colorWhite,
                              ),
                              verticalSpace(height: ScreenConstant.size16),
                              Row(
                                children: [
                                  Expanded(
                                      child: balanceCard('Current balance',
                                          ImagePath.coinsImg, 52, 'Points')),
                                  horizontalSpace(width: ScreenConstant.size12),
                                  Expanded(
                                    child: earnedCard('Total earned : ', 71,
                                        'Total redeemed : ', 16),
                                  ),
                                ],
                              ),
                              verticalSpace(height: ScreenConstant.size12),
                              Container(
                                height: ScreenConstant.size60,
                                padding: EdgeInsets.symmetric(
                                    horizontal: ScreenConstant.size12,
                                    vertical: ScreenConstant.size12),
                                decoration: BoxDecoration(
                                    color: const Color(0xff000000)
                                        .withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(
                                        ScreenConstant.size4)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: 'Ways to redeem :',
                                      fontSize: FontSize.s10,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xffEEEEEE),
                                    ),
                                    SvgPicture.asset(ImagePath.mobileImg),
                                    CustomText(
                                      text: 'Recharge',
                                      fontSize: FontSize.s10,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xffEEEEEE),
                                    ),
                                    SvgPicture.asset(ImagePath.cashbackImg),
                                    CustomText(
                                      text: 'Cashback',
                                      fontSize: FontSize.s10,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xffEEEEEE),
                                    )
                                  ],
                                ),
                              ),
                              verticalSpace(height: ScreenConstant.size12),
                              Container(
                                height: ScreenConstant.size50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      ScreenConstant.size6),
                                  color: AppColors.colorWhite,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Spacer(),
                                    CustomText(
                                      text: 'Redeem Points Now',
                                      color: AppColors.colorBlue,
                                      fontSize: FontSize.s18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    const Spacer(),
                                    //SizedBox(height: ScreenConstant.size50,child: SvgPicture.asset(ImagePath.flowerImage,fit: BoxFit.fill,)),
                                    SizedBox(
                                      height: ScreenConstant.size50,
                                      child: Image.asset(
                                        ImagePath.flowerImage,
                                        color: AppColors.colorBlue,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenConstant.size20,
                      vertical: ScreenConstant.size24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      locateAtmCard(),
                      verticalSpace(height: ScreenConstant.size24),
                      advertisingCard(),
                      verticalSpace(height: ScreenConstant.size30),
                      CustomText(
                        text: 'Loan categories',
                        fontSize: FontSize.s20,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff2D2D2D),
                      ),
                      verticalSpace(height: ScreenConstant.size4),

                      SizedBox(
                        height: ScreenConstant.size400,
                        child: GridView.count(
                          crossAxisCount: 3,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          physics: const ClampingScrollPhysics(),
                          children: [
                            GridContainer(
                              image: ImagePath.personalLoanImg,
                              text: 'Personal',
                            ),
                            GridContainer(
                              image: ImagePath.bikeLoan,
                              text: 'Bike',
                            ),
                            GridContainer(
                              image: ImagePath.tractorLoan,
                              text: 'Farm EQP',
                            ),
                            GridContainer(
                              image: ImagePath.msmeLoan,
                              text: 'Track Based',
                            ),
                            GridContainer(
                              image: ImagePath.goldLoan,
                              text: 'Gold',
                            ),
                            GridContainer(
                              image: ImagePath.creditCard,
                              text: 'Credit Card',
                            ),
                            GridContainer(
                              image: ImagePath.creditScore,
                              text: 'Credit Score',
                            ),
                            GridContainer(
                              image: ImagePath.emiCard,
                              text: 'EMI Card',
                            ),
                          ],
                        ),
                      ),
                      //Spacer(),
                      const Divider(),
                      verticalSpace(height: ScreenConstant.size30),
                      CustomText(
                        text: 'Payments',
                        fontSize: FontSize.s20,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff2D2D2D),
                      ),
                      SizedBox(
                        height: ScreenConstant.size160,
                        child: GridView.count(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          physics: const ClampingScrollPhysics(),
                          children: [
                            GridContainer(
                              image: ImagePath.recharge,
                              text: 'Recharge',
                              colors: const [
                                Color(0xffFFF3EE),
                                Color(0xffF8F9FB)
                              ],
                            ),
                            GridContainer(
                              image: ImagePath.fastTag,
                              text: 'FASTag',
                              colors: const [
                                Color(0xffFFF3EE),
                                Color(0xffF8F9FB)
                              ],
                            ),
                            GridContainer(
                              image: ImagePath.dth,
                              text: 'DTH',
                              colors: const [
                                Color(0xffFFF3EE),
                                Color(0xffF8F9FB)
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      verticalSpace(height: 30),
                      CustomText(
                        text: 'Insurance',
                        fontSize: FontSize.s20,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff2D2D2D),
                      ),
                      verticalSpace(height: ScreenConstant.size4),
                      SizedBox(
                        height: ScreenConstant.size280,
                        //color: Colors.redAccent,
                        child: GridView.count(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          physics: const ClampingScrollPhysics(),
                          children: [
                            GridContainer(
                              image: ImagePath.twoWheeler,
                              text: '2 Wheeler',
                              colors: const [
                                Color(0xffFFFFEF),
                                Color(0xffF8F9FB)
                              ],
                            ),
                            GridContainer(
                              image: ImagePath.fourWheeler,
                              text: '4 Wheeler',
                              colors: const [
                                Color(0xffFFFFEF),
                                Color(0xffF8F9FB)
                              ],
                            ),
                            GridContainer(
                              image: ImagePath.criticalIllness,
                              text: 'Critical Illness',
                              colors: const [
                                Color(0xffFFFFEF),
                                Color(0xffF8F9FB)
                              ],
                            ),
                            GridContainer(
                              image: ImagePath.accident,
                              text: 'Accident',
                              colors: const [
                                Color(0xffFFFFEF),
                                Color(0xffF8F9FB)
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      verticalSpace(height: ScreenConstant.size30),
                      CustomText(
                        text: 'Savings',
                        fontSize: FontSize.s20,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff2D2D2D),
                      ),
                      SizedBox(
                        height: ScreenConstant.size150,
                        //color: Colors.redAccent,
                        child: GridView.count(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          physics: const ClampingScrollPhysics(),
                          children: [
                            GridContainer(
                              image: ImagePath.fd,
                              text: 'FD (Fixed D...)',
                              colors: const [
                                Color(0xffF3EDFF),
                                Color(0xffF8F9FB)
                              ],
                            ),
                            GridContainer(
                              image: ImagePath.digiGold,
                              text: 'Digi Gold',
                              colors: const [
                                Color(0xffF3EDFF),
                                Color(0xffF8F9FB)
                              ],
                            ),
                            GridContainer(
                              image: ImagePath.digiSilver,
                              text: 'Digi Silver',
                              colors: const [
                                Color(0xffF3EDFF),
                                Color(0xffF8F9FB)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            //CustomNavigationBar()
          ],
        ),
      ),
      //bottomNavigationBar: CustomNavigationBar(),
    );
  }

  //balanceCard Widget
  Widget balanceCard(
      String? headerTxt, String? image, int? coins, String? points) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: ScreenConstant.size80,
        width: ScreenConstant.size180,
        padding: EdgeInsets.symmetric(
            horizontal: ScreenConstant.size12, vertical: ScreenConstant.size14),
        decoration: BoxDecoration(
            color: const Color(0xff000000).withOpacity(0.4),
            borderRadius:
                const BorderRadius.only(topRight: Radius.circular(28))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: headerTxt ?? '',
              fontSize: FontSize.s14,
              fontWeight: FontWeight.w400,
              color: AppColors.colorWhite,
            ),
            verticalSpace(height: 6),
            Row(
              children: [
                SvgPicture.asset(image!),
                horizontalSpace(width: ScreenConstant.size6),
                Text.rich(
                  TextSpan(
                    text: coins.toString(),
                    style: TextStyle(
                        fontSize: FontSize.s24,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xffEEEEEE),
                        fontFamily: 'Graphik'),
                    children: <InlineSpan>[
                      WidgetSpan(
                          alignment: PlaceholderAlignment.baseline,
                          baseline: TextBaseline.alphabetic,
                          child: SizedBox(width: ScreenConstant.size6)),
                      TextSpan(
                          text: points,
                          style: TextStyle(
                              fontSize: FontSize.s16,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xffEEEEEE),
                              fontFamily: 'Graphik')),

                      // can add more TextSpans here...
                    ],
                  ),
                  textScaleFactor: 1,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  //earnedCard
  Widget earnedCard(String? totalEarned, int? totalEarnedPoints,
      String? totalRedeemed, int totalRedeemedPoints) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: ScreenConstant.size80,
        width: ScreenConstant.size180,
        padding: EdgeInsets.symmetric(
            horizontal: ScreenConstant.size12, vertical: ScreenConstant.size14),
        decoration: BoxDecoration(
            color: const Color(0xff000000).withOpacity(0.4),
            borderRadius:
                const BorderRadius.only(topLeft: Radius.circular(28))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(
              TextSpan(
                text: totalEarned,
                style: TextStyle(
                    fontSize: FontSize.s14,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xffEEEEEE),
                    fontFamily: 'Graphik'),
                children: <TextSpan>[
                  TextSpan(
                      text: totalEarnedPoints.toString(),
                      style: TextStyle(
                          fontSize: FontSize.s14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xffEEEEEE),
                          fontFamily: 'Graphik')),
                  // can add more TextSpans here...
                ],
              ),
              textScaleFactor: 1,
            ),
            //verticalSpace(height: ScreenConstant.size6),
            Text.rich(
              TextSpan(
                text: totalRedeemed,
                style: TextStyle(
                    fontSize: FontSize.s14,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xffEEEEEE),
                    fontFamily: 'Graphik'),
                children: <TextSpan>[
                  TextSpan(
                      text: totalRedeemedPoints.toString(),
                      style: TextStyle(
                        fontSize: FontSize.s14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xffEEEEEE),
                        fontFamily: 'Graphik',
                      )),
                  // can add more TextSpans here...
                ],
              ),
              //textScaleFactor: 1,
            )
          ],
        ),
      ),
    );
  }

  //locateAtmCard
  Widget locateAtmCard() {
    return Container(
      height: ScreenConstant.size94,
      width: ScreenConstant.screenWidthFull,
      padding: EdgeInsets.symmetric(
          horizontal: ScreenConstant.size16, vertical: ScreenConstant.size16),
      decoration: BoxDecoration(
        color: const Color(0xffD9D9D9),
        borderRadius: BorderRadius.circular(ScreenConstant.size10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomText(
            text: 'Find the nearest India1 ATM',
            fontSize: FontSize.s14,
            fontWeight: FontWeight.w600,
            color: AppColors.colorBlack,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  text: '2x/3x',
                  style: TextStyle(
                      fontSize: FontSize.s14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff000000),
                      fontFamily: 'Graphik'),
                  children: <InlineSpan>[
                    WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: SizedBox(width: ScreenConstant.size6)),
                    TextSpan(
                      text: 'rewards at ATMs',
                      style: TextStyle(
                          fontSize: FontSize.s14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff000000),
                          fontFamily: 'Graphik'),
                    ),
                    // can add more TextSpans here...
                  ],
                ),
                textScaleFactor: 1,
              ),
              Container(
                height: ScreenConstant.size30,
                width: ScreenConstant.size120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(ScreenConstant.size6),
                    gradient: const LinearGradient(colors: [
                      Colors.orange,
                      Colors.red,
                    ])),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    CustomText(
                      text: 'Locate ATM',
                      color: const Color(0xff2D2D2D),
                      fontSize: FontSize.s10,
                      fontWeight: FontWeight.w600,
                    ),
                    const Spacer(),
                    //SizedBox(height: ScreenConstant.size50,child: SvgPicture.asset(ImagePath.flowerImage,fit: BoxFit.fill,)),
                    SizedBox(
                      height: ScreenConstant.size50,
                      child: Image.asset(
                        ImagePath.flowerImage,
                        color: AppColors.colorBlue,
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget advertisingCard() {
    return Container(
      padding: EdgeInsets.only(left: ScreenConstant.size16),
      height: ScreenConstant.size130,
      width: ScreenConstant.screenWidthFull,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ScreenConstant.size12),
        gradient: const LinearGradient(
          // begin: Alignment.centerLeft,
          // end: Alignment.centerRight,
          colors: [
            Color(0xff004280),
            Color(0xffFE878C),
            Color(0xff004280),
          ],
        ),
      ),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: ScreenConstant.size24),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: CustomText(
                      text: 'No need to roam for loans anymore',
                      fontSize: FontSize.s11,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xffEBEBEB),
                    )),
              ),
              verticalSpace(height: ScreenConstant.size8),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: 'Get it on India1',
                  fontSize: FontSize.s18,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xffEBEBEB),
                ),
              ),
              verticalSpace(
                height: ScreenConstant.size18,
              ),
              Row(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: CustomText(
                      text: 'Apply Now',
                      fontSize: FontSize.s12,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xffFFEE48),
                    ),
                  ),
                  horizontalSpace(width: ScreenConstant.size8),
                  SvgPicture.asset(ImagePath.arrowIcon)
                ],
              )
            ],
          ),
          SvgPicture.asset(
            ImagePath.advertiseCardImg,
            height: ScreenConstant.size130,
          ),
        ],
      ),
    );
  }

  //popup container
  Widget popupButton() {
    return Stack(
      children: [
        Container(
          height: ScreenConstant.size70,
          width: ScreenConstant.size140,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              )),
          child: Column(
            children: [
              CustomText(
                text: 'My Profile',
                fontSize: FontSize.s14,
                fontWeight: FontWeight.w400,
                color: const Color(0xff2D2D2D),
              ),
              const Divider(),
              CustomText(
                text: 'My Rewards',
                fontSize: FontSize.s14,
                fontWeight: FontWeight.w400,
                color: const Color(0xff2D2D2D),
              )
            ],
          ),
        )
      ],
    );
  }
}
