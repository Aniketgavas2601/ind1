import 'dart:async';

import 'package:get/get.dart';

class TimerController extends GetxController{
  Timer? _timer;
  int remainingSeconds= 0;
  final time = '00.00'.obs;

  @override
  void onReady() {
    _startTimer(60);
    super.onReady();
  }

  @override
  void onClose() {
    if(_timer != null){
      _timer!.cancel();
    }
    super.onClose();
  }



  _startTimer(int seconds){
    const duration = Duration(seconds: 1);
    remainingSeconds = seconds;
    _timer = Timer.periodic(duration, (timer) {
      if(remainingSeconds == 0){
        _timer!.cancel();
      }else{
        int minutes = remainingSeconds~/60;
        int seconds = (remainingSeconds%60);
        time.value = minutes.toString().padLeft(2, '0')+":"+seconds.toString().padLeft(2,'0');
        remainingSeconds--;
      }
    });
  }
}