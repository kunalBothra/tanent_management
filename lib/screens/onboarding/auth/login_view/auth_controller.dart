import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanent_management/screens/navbar/navbar_view.dart';
import 'package:tanent_management/screens/onboarding/auth/login_view/otp_screen.dart';

class AuthController extends GetxController{
  //variables
  final selectedItem = ''.obs;
  var items = ["  +91", "  +64"].obs;

  final isTimeComplete = false.obs;
  final countdownTimer = Rxn<Timer>().obs;
  final myDuration = const Duration(seconds: 60).obs;


  final otpController1 = TextEditingController().obs;
  final otpController2 = TextEditingController().obs;
  final otpController3 = TextEditingController().obs;
  final otpController4 = TextEditingController().obs;
  final  otpFocus1 = FocusNode().obs;
  final  otpFocus2 = FocusNode().obs;
  final  otpFocus3 = FocusNode().obs;
  final  otpFocus4 = FocusNode().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    selectedItem.value = items.value[0];
    startTimer();
    super.onInit();
  }

  onLoginPressed(){
    Get.to(()=> OtpScreen());
  }

  onOtpSubmitPressed(){
    Get.to(()=>const NavBar(initialPage: 0));
  }

  void startTimer() {
    countdownTimer.value.value =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void stopTimer() {
    countdownTimer!.value.value!.cancel();
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
      final seconds = myDuration.value.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.value.value!.cancel();

          isTimeComplete.value = true;

      } else {
        myDuration.value = Duration(seconds: seconds);
      }
  }
}