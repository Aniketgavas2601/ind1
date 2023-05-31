import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController{


  var currentLanguage = 0.obs;

  updateLanguage(int index, String langCode, String countryCode){
    currentLanguage.value = index;
    var locale = Locale(langCode,countryCode);
    Get.updateLocale(locale);
    log(currentLanguage.toString());
  }
}