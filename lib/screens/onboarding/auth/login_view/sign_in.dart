import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tanent_management/common/constants.dart';
import 'package:tanent_management/screens/onboarding/auth/login_view/auth_controller.dart';

import 'auth_widgets.dart';

class SignInScreen extends StatelessWidget {
  bool? isFromRegister;
  bool? isFrstTime;
   SignInScreen({required this.isFromRegister, this.isFrstTime, super.key});

   final authCntrl = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(top: 90.h,bottom: 30.h,right: 50.w,left: 50.w),
              child: Center(child: splashImage),
            ),
            AuthWidget.loginForm(),
           isFromRegister!?SizedBox(): AuthWidget.registrationBox()
      
          ],
        ),
      ),
    );
  }
}
