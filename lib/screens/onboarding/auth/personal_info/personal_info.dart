import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tanent_management/common/widgets.dart';
import 'package:tanent_management/screens/onboarding/auth/landlord_document/landlord_view.dart';
import 'package:tanent_management/screens/onboarding/auth/login_view/auth_controller.dart';
import 'package:tanent_management/screens/onboarding/auth/personal_info/personal_info_controller.dart';
import 'package:tanent_management/screens/onboarding/auth/personal_info/personal_info_widget.dart';

import '../../../../common/text_styles.dart';

class PersonalInfo extends StatelessWidget {
  PersonalInfo({super.key});

  final personalInfoCntrl = Get.put(PersonalInfoController());
  final authCntrl = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Personal Information', style: CustomStyles.otpStyle050505),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.r),
            child: InkWell(
                onTap: (){
                  personalInfoCntrl.onSkipTap();
                },
                child: Text('Skip', style: CustomStyles.skipBlack)),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                color: HexColor('#679BF1'),
                height: 5.h,
                width: Get.width / 2,
              ),
              Container(
                color: HexColor('#F8F8F8'),
                height: 5.h,
                width: Get.width / 2,
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w,vertical: 10.h),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Text('Personal Information', style: CustomStyles.skipBlack),
                  Divider(),
                  SizedBox(height: 10.h,),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Container(
                          height: 99.h,
                          width: 110.w,
                          decoration: BoxDecoration(
                            color: HexColor('#444444'),
                            borderRadius: BorderRadius.circular(10.r),
                            image: DecorationImage(
                                image: Image.asset('assets/icons/profile.png')
                                    .image,
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Text('Add Profile',
                            style: CustomStyles.skipBlack
                                .copyWith(fontWeight: FontWeight.w400)),
                      )
                    ],
                  ),
                  SizedBox(height: 5.h,),

                  PersonlInfoWidget.commomText('Full Name'),
                  customTextField(
                    controller: personalInfoCntrl.nameCntrl.value,
                      focusNode: personalInfoCntrl.nameFocus.value,
                      hintText: 'Type Here...',
                      isBorder: true,
                      color: HexColor('#F7F7F7'),
                      isFilled: false),

                  SizedBox(height: 5.h,),
                  PersonlInfoWidget.commomText('Email Id'),
                  customTextField(
                      controller: personalInfoCntrl.emailCntrl.value,
                      focusNode: personalInfoCntrl.emailFocus.value,
                      hintText: 'Type Here...',
                      isBorder: true,
                      color: HexColor('#F7F7F7'),
                      isFilled: false),
                  SizedBox(height: 5.h,),
                  PersonlInfoWidget.commomText('Mobile Number',
                      isMandatory: true),
                  customTextField(
                      controller: personalInfoCntrl.phoneCntrl.value,
                      focusNode: personalInfoCntrl.phoneFocus.value,
                      hintText: 'Enter Mobile Number',
                      isBorder: true,
                      color: HexColor('#F7F7F7'),
                      isFilled: false,
                      isForCountryCode: true),
                  SizedBox(height: 5.h,),
                  PersonlInfoWidget.commomText('Permanent Address'),
                  customTextField(
                      controller: personalInfoCntrl.permanentAddCntrl.value,
                      focusNode: personalInfoCntrl.permanentFocus.value,
                      hintText: 'Type Here...',
                      isBorder: true,
                      color: HexColor('#F7F7F7'),
                      isFilled: false,
                      maxLines: 3),
                  SizedBox(height: 5.h,),
                  PersonlInfoWidget.commomText('Pincode', isMandatory: true),
                  customTextField(
                      controller: personalInfoCntrl.pinNoCntrl.value,
                      focusNode: personalInfoCntrl.pinNoFocus.value,
                      hintText: 'Type Here...',
                      isBorder: true,
                      color: HexColor('#F7F7F7'),
                      isFilled: false),
                  SizedBox(height: 5.h,),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PersonlInfoWidget.commomText('City'),
                          customTextField(
                              width: Get.width / 2.3,
                              hintText: 'Type Here...',
                              isBorder: true,
                              color: HexColor('#F7F7F7'),
                              isFilled: false),
                        ],
                      ),
                      SizedBox(width: 15.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PersonlInfoWidget.commomText('State'),
                          customTextField(
                              width: Get.width / 2.3,
                              hintText: 'Type Here...',
                              isBorder: true,
                              color: HexColor('#F7F7F7'),
                              isFilled: false),
                        ],
                      )
                    ],
                  ),
                  customButton(
                      onPressed: () {
                        personalInfoCntrl.onNextTap();
                      },
                      text: 'Next',
                      width: Get.width,
                      verticalPadding: 10.h),
                  SizedBox(
                    height: 10.h,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
