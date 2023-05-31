import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:indiaone/src/screen_constant/screen_constant.dart';
import 'package:indiaone/src/themes/common_colors.dart';
import 'package:indiaone/src/widgets/custom_text.dart';
import '../screens/select_language/languge_controller.dart';
import '../texts/texts.dart';

class LangContainer extends StatelessWidget {
  final String lang;
  final VoidCallback onTap;
  //bool? isSelected;
  int? lanCode;

  LangContainer({
    required this.lang,
    required this.onTap,
    //required this.isSelected,
    required this.lanCode,
  });

  final languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return Obx(

      ()=>Column(
        children: [
          SizedBox(
            height: ScreenConstant.size20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: onTap,
                  child: Container(
                      height: ScreenConstant.size66,
                      width: ScreenConstant.size150,
                      decoration: BoxDecoration(
                          color: languageController.currentLanguage.value == lanCode ? AppColors.colorBlue : AppColors.colorWhite,
                          borderRadius: BorderRadius.circular(ScreenConstant.size20)),
                      child: Padding(
                        padding: EdgeInsets.only(left: ScreenConstant.size16),
                        child: Row(
                          children: [
                            Container(
                              height: ScreenConstant.size16,
                              width: ScreenConstant.size16,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: languageController.currentLanguage.value == lanCode ? Color(0xffFFFFFF) : Color(0xffEDEDED)),
                                color: languageController.currentLanguage.value == lanCode ? Color(0xff004280) : Color(0xffEDEDED)
                              ),
                              child: Center(child:  languageController.currentLanguage.value == lanCode ? Icon(Icons.check,size: 9,color: Color(0xffFFFFFF),) : null),
                            ),
                            SizedBox(width: ScreenConstant.size10,),
                            CustomText(
                              text: lang,
                              color: languageController.currentLanguage.value == lanCode ? AppColors.colorWhite : AppColors.colorBlack,
                              fontWeight: FontWeight.w600,
                              fontSize: FontSize.s20,
                            )
                          ],
                        ),
                      )),
                ),
            ],
          )
        ],
      ),
    );
  }
}
