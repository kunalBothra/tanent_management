import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tanent_management/common/text_styles.dart';
import 'package:tanent_management/screens/onboarding/auth/login_view/auth_controller.dart';
import 'package:tanent_management/screens/onboarding/auth/login_view/sign_in.dart';

import '../../../../common/widgets.dart';
import '../personal_info/personal_info.dart';

class AuthWidget{
  static loginForm(){
    final authCntrl = Get.find<AuthController>();
    return
      Padding(
        padding:  EdgeInsets.only(right: 15.w,left: 15.w,bottom: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Mobile Number',style: CustomStyles.titleText,),
            SizedBox(height: 10.h,),
            customTextField(
              maxLength: 10,
              isForCountryCode: true,
              hintStyle: CustomStyles.hintText,
            hintText: 'Enter Mobile Number',
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.number,
            isBorder: true,
            isFilled: false
        ),
            SizedBox(height: 20.h,),
            customButton(onPressed:(){
              authCntrl.onLoginPressed();
            } ,text: authCntrl.isFromRegister.value?'Proceed': 'Login',width: Get.width)
          ],
        ),
      );
  }

  static registrationBox(){
    final authCntrl = Get.find<AuthController>();

    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 15.w),
      child: Container(
        height: 149.h,
        width: Get.width,
        decoration: BoxDecoration(
          color: HexColor('#F8F8F8'),
          borderRadius: BorderRadius.circular(7.r),
          border: Border.all(color: HexColor('#8AB9F1'),width: 2.w)
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 15.w, vertical: 17.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Registration',style: CustomStyles.titleText.copyWith(fontWeight: FontWeight.w600,fontFamily: 'Inter'),),
              SizedBox(height: 5.h,),
              Text('Join us today and experience the daily benefits of freshness firsthand!',style: CustomStyles.descriptionText6c6c6c),
              SizedBox(height: 5.h,),
              customButton(onPressed: (){
                resgisterPopup(
                  title: 'Registration',
                  subtitle: 'Join us today and experience the daily benefits of freshness firsthand!',
                  button1: 'Landlord',
                  button2: 'Tenants',
                  onButton1Tap: () {
                    authCntrl.isFromRegister.value=true;
                    Get.back();
                    Get.to(()=>
                    authCntrl.isFromRegister.value?SignInScreen(isFromRegister: authCntrl.isFromRegister.value): PersonalInfo(isFromRegister: authCntrl.isFromRegister.value,));

                  },
                  onButton2Tap: (){
                    authCntrl.isFromRegister.value=true;
                    Get.back();
                    Get.to(()=>
                    authCntrl.isFromRegister.value?SignInScreen(isFromRegister: authCntrl.isFromRegister.value): PersonalInfo(isFromRegister:authCntrl. isFromRegister.value,));
                  },
                );
              },text: 'Register Now',height: 37.h)
            ],
          ),
        ),
      ),
    );
  }

  static otpTextFields({required bool? isFromRegister}){
    final authCntrl = Get.find<AuthController>();

   return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: [
       SizedBox(height:isFromRegister!?0.h: 20.h,),
       isFromRegister!?SizedBox(): Text('Welcome back',style: TextStyle(
         fontWeight: FontWeight.w600,
         fontSize: 20.sp,
         color: HexColor('#111111'),
       )),
       SizedBox(height: 5.h,),
       Text('Please enter the OTP sent to your registered mobile number.',style: CustomStyles.descriptionText6c6c6c),
       SizedBox(height: 15.h,),

       Text('Mobile Number',style: CustomStyles.titleText,),
       SizedBox(height: 5.h,),
       customTextField(
         readOnly: true,
           color: HexColor('#F7F7F7'),
           hintStyle: CustomStyles.hintText,
           hintText: '+919057917159',
           textInputAction: TextInputAction.done,
           keyboardType: TextInputType.number,
           isBorder: true,
           isFilled: false
       ),
       Padding(
          padding: EdgeInsets.only(
              left: 15.w, right: 15.w, top: 10.h, bottom: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              otpTextField(
                  authCntrl.otpController1.value, authCntrl.otpFocus1.value, authCntrl.otpFocus1.value, authCntrl.otpFocus2.value),
              otpTextField(
                  authCntrl.otpController2.value, authCntrl.otpFocus2.value, authCntrl.otpFocus1.value, authCntrl.otpFocus3.value),
              otpTextField(
                  authCntrl.otpController3.value, authCntrl.otpFocus3.value, authCntrl.otpFocus2.value, authCntrl.otpFocus4.value),
              otpTextField(
                  authCntrl.otpController4.value, authCntrl.otpFocus4.value, authCntrl.otpFocus3.value, authCntrl.otpFocus4.value),
            ],
          ),
         
        ),
       Row(
         mainAxisAlignment: MainAxisAlignment.end,
         children: [

           Padding(
             padding: const EdgeInsets.only(right: 8.0),
             child: Text('02:39',style: CustomStyles.descriptionText6c6c6c,),
           ),
         ],
       ),
       SizedBox(height: 10.h,)
     ],
   );
  }

  static resendButtonWidget(){
    return Padding(
      padding:  EdgeInsets.only(top: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Didn’t receive the code? ',style: CustomStyles.lightHint16),
          Text('Resend',style: CustomStyles.titleText.copyWith(fontWeight: FontWeight.w700),),
        ],
      ),
    );
  }

}

Widget otpTextField(TextEditingController controller, FocusNode focus,
    FocusNode previousFocus, FocusNode nextFocus) {
  return Container(
    width: 49.w,
    height: 49.h,
    decoration: BoxDecoration(
      color: HexColor('#F8F8F8'),
        borderRadius: BorderRadius.circular(8.r)
    ),
    child: TextFormField(
      focusNode: focus,
      controller: controller,
      textAlign: TextAlign.center,
      style: CustomStyles.otpStyle050505,
      keyboardType: TextInputType.number,
      maxLength: 1,
      onChanged: (value) {
        if (value == '') {
          previousFocus.requestFocus();
        } else {
          nextFocus.requestFocus();
        }

        // setState(() {
        //   mergedOtp = (_otpController1.text.trim() +
        //       _otpController2.text.trim() +
        //       _otpController3.text.trim() +
        //       _otpController4.text.trim())
        //       .toString();
        // });
      },
      decoration: InputDecoration(
        counterText: '',
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: Colors.transparent)
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(color: Colors.transparent)
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide:  BorderSide(color: HexColor('#111111'))
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
    ),
  );
}