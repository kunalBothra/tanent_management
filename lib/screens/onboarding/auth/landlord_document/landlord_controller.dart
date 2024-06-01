import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tanent_management/screens/onboarding/auth/login_view/sign_in.dart';

class LandlordDocController extends GetxController{
  final aadharCntrl = TextEditingController().obs;
  final govIdCntrl = TextEditingController().obs;
  final otherDocCntrl = TextEditingController().obs;

  final  aadharFocus = FocusNode().obs;
  final  govIdFocus = FocusNode().obs;
  final  otherDocFocus = FocusNode().obs;

  final profileImage = Rxn<dynamic>();
  final imageFile =Rxn<File>();

  //finctions
  onPreviousTap(){
    Get.back();
  }

  onSubmitTap(){
    Get.offAll(()=>SignInScreen());
  }


}