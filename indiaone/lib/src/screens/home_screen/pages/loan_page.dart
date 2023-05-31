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
import 'package:indiaone/src/widgets/custom_refferal_card.dart';
import 'package:indiaone/src/widgets/custom_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoanPage extends StatelessWidget {

  NotificationService notificationService = NotificationService();

  CustomReferCard customCard = CustomReferCard();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  child: Stack(
                    children: [
                      Container(
                        height: ScreenConstant.size340,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(ImagePath.loanBg),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: ScreenConstant.size20,),
                          child: Stack(
                            children: [
                              Column(
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
                                      // Stack(
                                      //   //alignment: Alignment.topLeft,
                                      //   children: [
                                      //     SvgPicture.asset(ImagePath.design)
                                      //   ],
                                      // ),
                                      Row(
                                        children: [
                                          HeadingContainer(
                                            text: 'Aa',
                                          ),
                                          horizontalSpace(
                                              width: ScreenConstant.size10),
                                          HeadingContainer(
                                            image: ImagePath.bellIcon,
                                            onTap: (){
                                              notificationService.sendNotification('this is a title', 'this is a body');
                                            },
                                          ),
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
                                            //initialValue: selectMenu,
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
                                      ),
                                    ],
                                  ),
                                  verticalSpace(height: ScreenConstant.size10),

                                  Stack(
                                    //alignment: Alignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(right: ScreenConstant.size20),
                                            child: Row(
                                              //crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                        //color: Colors.lightBlue,
                                                        height: ScreenConstant.size50,
                                                        width: ScreenConstant.size150,
                                                        child: Text('No need to roam for loans anymore',style: TextStyle(color: Color(0xffFFFFFF),fontSize: FontSize.s18,fontWeight: FontWeight.w500),)),
                                                    verticalSpace(height: ScreenConstant.size10),
                                                    Text('Get it on India1',style: TextStyle(
                                                        color: Color(0xffFFEF37),fontSize: FontSize.s24,fontWeight: FontWeight.w600
                                                    ),),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    SvgPicture.asset(ImagePath.loanPageMoney),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          //verticalSpace(height: ScreenConstant.size10),
                                        ],
                                      ),
                                      Align(
                                          alignment: Alignment.centerRight,
                                          child: SvgPicture.asset(ImagePath.design1),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: ScreenConstant.size20,vertical: ScreenConstant.size30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                          ],
                        ),
                      ),
                      Divider(color: Color(0xffDDDDDD),),
                      verticalSpace(height: ScreenConstant.size20),
                      customCard.customRefferalCard()
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
