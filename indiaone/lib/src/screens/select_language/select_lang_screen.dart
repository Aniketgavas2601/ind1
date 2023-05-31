import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:indiaone/src/screens/login_screen/login_screen.dart';
import 'package:indiaone/src/screens/select_language/languge_controller.dart';
import 'package:indiaone/src/enums/enum.dart';
import 'package:indiaone/src/image_path/image_path.dart';
import 'package:indiaone/src/screen_constant/screen_constant.dart';
import 'package:indiaone/src/texts/texts.dart';
import 'package:indiaone/src/themes/common_colors.dart';
import 'package:indiaone/src/widgets/custom_text.dart';
import 'package:indiaone/src/widgets/lang_container.dart';
import 'package:get/get.dart';

class SelectLangScreen extends StatelessWidget {
  //bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    // instance of language controller

    final languageController = Get.put(LanguageController());

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: ScreenConstant.screenHeightFull,
        width: ScreenConstant.screenWidthFull,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          image: const DecorationImage(
            image: AssetImage(
              ImagePath.langBg,
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                top: ScreenConstant.size80,
                left: ScreenConstant.size40,
                right: ScreenConstant.size40,
                bottom: ScreenConstant.size20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(ImagePath.indiaOne),
                SizedBox(
                  height: ScreenConstant.size40,
                ),
                CustomText(
                  text: 'select_preferred_language'.tr,
                  color: AppColors.colorBlack,
                  fontSize: FontSize.s24,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  height: ScreenConstant.size40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LangContainer(
                      lanCode: 0,
                      lang: Texts.englishLang,
                      onTap: () => languageController.updateLanguage(LanguageType.ENGLISH.index, 'en', 'US'),
                    ),
                    LangContainer(
                      lanCode: 1,
                      lang: Texts.kannadaLang,
                      onTap: () => languageController
                          .updateLanguage(LanguageType.KANNADA.index, 'ka', 'IN'),
                    ),
                  ],
                ),
                SizedBox(
                  height: ScreenConstant.size12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LangContainer(
                      lanCode: 2,
                      //isSelected: isChecked,
                      lang: Texts.hindiLang,
                      onTap: () => languageController.updateLanguage(LanguageType.HINDI.index, 'hi', 'IN'),
                    ),
                    LangContainer(
                      lanCode: 3,
                      //isSelected: isChecked,
                      lang: Texts.marathiLang,
                      onTap: () => languageController
                          .updateLanguage(LanguageType.MARATHI.index, 'ma', 'IN'),
                    ),
                  ],
                ),
                SizedBox(
                  height: ScreenConstant.size12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LangContainer(
                      lanCode: 4,
                      //isSelected: isChecked,
                      lang: Texts.teluguLang,
                      onTap: () => languageController
                          .updateLanguage(LanguageType.TELUGU.index, 'te', 'IN'),
                    ),
                    LangContainer(
                      lanCode: 5,
                      //isSelected: isChecked,
                      lang: Texts.tamilLang,
                      onTap: () => languageController
                          .updateLanguage(LanguageType.TAMIL.index, 'ta', 'IN'),
                    ),
                  ],
                ),
                SizedBox(
                  height: ScreenConstant.size12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LangContainer(
                      lanCode: 6,
                      //isSelected: isChecked,
                      lang: Texts.malayalamLang,
                      onTap: () => languageController
                          .updateLanguage(LanguageType.MALAYALAM.index, 'ml', 'IN'),
                    ),
                    LangContainer(
                      lanCode: 7,
                      //isSelected: isChecked,
                      lang: Texts.bengaliLang,
                      onTap: () => languageController
                          .updateLanguage(LanguageType.BENGALI.index, 'be', 'IN'),
                    ),
                  ],
                ),
                SizedBox(
                  height: ScreenConstant.size12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LangContainer(
                      lanCode: 8,
                      //isSelected: isChecked,
                      lang: Texts.odiaLang,
                      onTap: () => languageController
                          .updateLanguage(LanguageType.ODIA.index, 'od', 'IN'),
                    ),
                  ],
                ),
                SizedBox(
                  height: ScreenConstant.size80,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(LoginScreen());
                  },
                  child: Container(
                    height: ScreenConstant.size50,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            end: Alignment.topRight,
                            colors: [Colors.orange, Colors.redAccent])),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        CustomText(
                          text: 'proceed'.tr,
                          color: AppColors.colorWhite,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        const Spacer(),
                        //SizedBox(height: ScreenConstant.size50,child: SvgPicture.asset(ImagePath.flowerImage,fit: BoxFit.fill,)),
                        SizedBox(
                            height: ScreenConstant.size50,
                            child: Image.asset(ImagePath.flowerImage))
                      ],
                    ),
                  ),
                ),
                // ElevatedButton(onPressed: (){
                //   var locale = Locale('en','US');
                //   Get.updateLocale(locale);
                //   print("tap me");
                // }, child: Text("Submit"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
