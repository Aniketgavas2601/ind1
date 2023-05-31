import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:indiaone/src/common_screens/webview_screen.dart';
import 'package:indiaone/src/image_path/image_path.dart';
import 'package:indiaone/src/screen_constant/screen_constant.dart';
import 'package:indiaone/src/screens/otp_screen/enter_otp_screen.dart';
import 'package:indiaone/src/screens/select_language/languge_controller.dart';
import 'package:indiaone/src/texts/texts.dart';
import 'package:indiaone/src/themes/common_colors.dart';
import 'package:indiaone/src/widgets/custom_button.dart';
import 'package:indiaone/src/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';

class LoginScreen extends StatefulWidget {

  static String verify = '';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  String? mobileNo = '';
  int charLength = 0;
  bool? termConditionChecked = false;
  bool? alertTextShow = false;

  //bool isPrivacyPolicy = false;
  bool isChecked = false;

  final autofill = SmsAutoFill();

  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    getMobilePopup();
    super.initState();
  }

  Future<void> getMobilePopup() async {
    try {
      var data = await autofill.hint ?? '';
      var buffer = StringBuffer();
      if (data.isNotEmpty) {
        mobileNo = data.substring(3);
        for (int i = 0; i < mobileNo!.length; i++) {
          buffer.write(mobileNo![i]);
          var nonZeroIndex = i + 1;
          if (nonZeroIndex % 4 == 0 && nonZeroIndex != mobileNo!.length) {
            buffer.write(' ');
          }
        }
        var autoSelectNumber = buffer.toString();
        mobileNo = autoSelectNumber;
        mobileNo = mobileNo.toString() + ' ';
        _textController.text = formatNumberSync(mobileNo.toString());
      }
    } catch (e) {}
  }



  validator() {
    if (_formKey.currentState == null || _formKey.currentState!.validate()) {
      print("validate");
    } else {
      print('Error');
    }
  }

  void submit() async {
    if (_textController.text == "") return;

    var appSignatureId = await SmsAutoFill().getAppSignature;
    Map sendOtpData = {
      "mobileNumber": _textController.text,
      "appSignature": appSignatureId,
    };
    print(sendOtpData);
  }

  @override
  Widget build(BuildContext context) {

    LanguageController instance = Get.find();

    return Scaffold(
      //backgroundColor: Colors.transparent,
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
                          text: 'mobile_number'.tr,
                          fontSize: ScreenConstant.size30,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: ScreenConstant.size70,
                        ),
                        Form(
                          key: _formKey,
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            controller: _textController,

                          ),
                          // child: TextFormField(
                          //   keyboardType: TextInputType.phone,
                          //   controller: _textController,
                          //   inputFormatters: [
                          //     FilteringTextInputFormatter.digitsOnly,
                          //     LengthLimitingTextInputFormatter(10),
                          //     MobileNumberFormatter()
                          //   ],
                          //   style: TextStyle(
                          //       letterSpacing: 3,
                          //       fontSize: FontSize.s24,
                          //       fontWeight: FontWeight.w500,
                          //       color: AppColors.colorBlack,
                          //   ),
                          //   //autofocus: false,
                          //   decoration: InputDecoration(
                          //     prefixIcon: Column(
                          //       mainAxisAlignment: MainAxisAlignment.center,
                          //       children: [
                          //         CustomText(text: '+91',fontSize: FontSize.s24,fontWeight: FontWeight.w400,)
                          //       ],
                          //     ),
                          //     hintText: '• • • •  • • •  • • •',
                          //     hintStyle: TextStyle(
                          //         fontWeight: FontWeight.w900,
                          //         color: Color(0xffD9D9D9),
                          //         fontSize: FontSize.s28),
                          //   ),
                          //   validator: (value) {
                          //     if (value == null || value.isEmpty) {
                          //       return 'please Enter a mobile Number';
                          //     } else if (value.length < 10) {
                          //       return '*Please enter a valid 10 digit mobile number';
                          //     } else {
                          //       return null;
                          //     }
                          //   },
                          //   onChanged: (value){
                          //     mobileNo = value;
                          //   },
                          // ),
                        ),
                        SizedBox(
                          height: ScreenConstant.size60,
                        ),
                        Row(
                          //crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              height: ScreenConstant.size20,
                              width: ScreenConstant.size20,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(color: const Color(0xffB5B5B5))),
                              child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isChecked = !isChecked;
                                    });
                                  },
                                  child: isChecked ? SvgPicture.asset(ImagePath.checkImage) : null
                              ),
                            ),
                            SizedBox(
                              width: ScreenConstant.size14,
                            ),
                            Text.rich(
                              TextSpan(
                                text: 'accept'.tr,
                                style: TextStyle(
                                    fontSize: FontSize.s16,
                                    fontWeight: FontWeight.w400),
                                children: <InlineSpan>[
                                  WidgetSpan(
                                      alignment: PlaceholderAlignment.baseline,
                                      baseline: TextBaseline.alphabetic,
                                      child: SizedBox(
                                          width: ScreenConstant.size6)),
                                  TextSpan(
                                      text: 'terms_&_conditions'.tr,
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Get.to(WebViewScreen(
                                              url:
                                                  'https://pub.dev/packages/webview_flutter'));
                                        },
                                      style: TextStyle(
                                          fontSize: FontSize.s16,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xff014381))),
                                  // can add more TextSpans here...
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 44,
                        ),
                        isChecked
                            ? GestureDetector(
                                onTap: () async {
                                  validator();
                                  await FirebaseAuth.instance.verifyPhoneNumber(
                                    phoneNumber: _textController.text,
                                    verificationCompleted: (PhoneAuthCredential credential) {},
                                    verificationFailed: (FirebaseAuthException e) {},
                                    codeSent: (String verificationId, int? resendToken) {  //this code is used for after sending successful otp msg
                                      LoginScreen.verify = verificationId;
                                      print(LoginScreen.verify);
                                      Get.to(EnterOtpSreen(_textController.text));
                                    },
                                    codeAutoRetrievalTimeout: (String verificationId) {},
                                  );
                                },
                                child: Container(
                                  height: ScreenConstant.size50,
                                  decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                          end: Alignment.topRight,
                                          colors: [
                                        Colors.orange,
                                        Colors.redAccent
                                      ])),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Spacer(),
                                      CustomText(
                                        text: 'proceed'.tr,
                                        color: AppColors.colorWhite,
                                        fontSize: FontSize.s16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      const Spacer(),
                                      //SizedBox(height: ScreenConstant.size50,child: SvgPicture.asset(ImagePath.flowerImage,fit: BoxFit.fill,)),
                                      SizedBox(
                                          height: ScreenConstant.size50,
                                          child: Image.asset(
                                              ImagePath.flowerImage))
                                    ],
                                  ),
                                ),
                              )
                            : CustomButton(
                                onTap: () {
                                  validator();
                                },
                                height: ScreenConstant.size50,
                                radius: ScreenConstant.size6,
                                color: const Color(0xffC1C1C1),
                                child: Center(
                                  child: Text(
                                    'request_otp'.tr,
                                    style: TextStyle(
                                        color: AppColors.colorWhite,
                                        fontSize: FontSize.s16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              )
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

//this class will be called, when their is change in textField
class MobileNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    String enterMobileNumber =
        newValue.text; // get data enter by used in textField
    StringBuffer buffer = StringBuffer();

    for (int i = 0; i < enterMobileNumber.length; i++) {
      // add each character into String buffer
      buffer.write(enterMobileNumber[i]);
      int index = i + 1;
      if (index % 4 == 0 && enterMobileNumber.length != index) {
        // add space after 4th digit
        buffer.write(" ");
      }
    }

    return TextEditingValue(
        text: buffer.toString(), // final generated credit card number
        selection: TextSelection.collapsed(
            offset: buffer.toString().length) // keep the cursor at end
        );
  }
}
