import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tanent_management/common/widgets.dart';
import 'package:tanent_management/screens/onboarding/auth/login_view/sign_in.dart';

import '../language/language.dart';

class WalkThroughController extends GetxController{
  //variables
  final pageController = PageController().obs;
  final initialPage = 0.obs;
  final checkboxValue = false.obs;

  //functions
  @override
  void onInit() {
    // TODO: implement onInit
    pageController.value.addListener(() {
      initialPage.value= pageController.value.page!.round();
    });
    super.onInit();
  }

  onGetStartedTap(){
    Get.to(()=> LanguageScreen(isFromProfile: false,));
  }

  onCheckBoxClicked(value){
    checkboxValue.value=value;

  }
  onNextClicked(){
    if(checkboxValue.value){
      Get.to(()=>SignInScreen());
    }
    else{
      customSnackBar(Get.context!, 'Please accept terms and conditions');
    }
  }
}