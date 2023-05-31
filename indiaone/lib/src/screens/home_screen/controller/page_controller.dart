import 'package:get/get.dart';

class PageChange extends GetxController{

  var currentPage = 0.obs;

  changeTab(int index){
    currentPage.value = index;
  }
}