import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tanent_management/screens/onboarding/auth/login_view/sign_in.dart';

import '../../../navbar/navbar_view.dart';

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

  onSubmitTap({required bool? isFromRegistered}){
    isFromRegistered!?  Get.offAll(()=>const NavBar(initialPage: 0))
    :  Get.offAll(()=>SignInScreen(isFromRegister: isFromRegistered,));
  }


}