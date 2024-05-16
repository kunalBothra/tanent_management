import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tanent_management/screens/onboarding/auth/login_view/auth_controller.dart';
import 'package:tanent_management/screens/onboarding/auth/login_view/auth_widgets.dart';

import '../../../../common/constants.dart';
import '../../../../common/widgets.dart';

class OtpScreen extends StatelessWidget {
   OtpScreen({super.key});

  final authCntrl = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              backArrowIcon(),
              AuthWidget.otpTextFields(),
              customButton(onPressed: (){authCntrl.onOtpSubmitPressed();},text: 'Submit', width: Get.width),
              AuthWidget.resendButtonWidget()
            ],
          ),
        ),
      ),
    );
  }
}
