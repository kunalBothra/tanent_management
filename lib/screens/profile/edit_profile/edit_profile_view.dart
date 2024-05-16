import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tanent_management/common/widgets.dart';
import 'package:tanent_management/screens/onboarding/auth/landlord_document/landlord_view.dart';
import 'package:tanent_management/screens/onboarding/auth/login_view/auth_controller.dart';
import 'package:tanent_management/screens/onboarding/auth/personal_info/personal_info_controller.dart';
import 'package:tanent_management/screens/onboarding/auth/personal_info/personal_info_widget.dart';
import 'package:tanent_management/screens/profile/edit_profile/edit_profile_controller.dart';
import 'package:tanent_management/screens/profile/edit_profile/edit_profile_widget.dart';

import '../../../../common/text_styles.dart';

class EditProfileVew extends StatelessWidget {
  EditProfileVew({super.key});

  final editCntrl = Get.put(EditProfileController());
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
            child: Text('Skip', style: CustomStyles.skipBlack),
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
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Text('Personal Information', style: CustomStyles.skipBlack),
                  Divider(),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: Container(
                              height: 99.h,
                              width: 110.w,
                              decoration: BoxDecoration(
                                color: HexColor('#444444'),
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image:
                                        Image.asset('assets/icons/profile.png')
                                            .image,
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0.h,
                              right: 0.w,
                              child: Image.asset(
                            'assets/icons/edit.png',
                            height: 30.h,
                          ))
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  EditProfileWidget.commomText('Full Name'),
                  customTextField(
                      controller: editCntrl.nameCntrl.value,
                      focusNode: editCntrl.nameFocus.value,
                      hintText: 'Type Here...',
                      isBorder: true,
                      color: HexColor('#F7F7F7'),
                      isFilled: false),
                  SizedBox(
                    height: 5.h,
                  ),
                  EditProfileWidget.commomText('Email Id'),
                  customTextField(
                      controller: editCntrl.emailCntrl.value,
                      focusNode: editCntrl.emailFocus.value,
                      hintText: 'Type Here...',
                      isBorder: true,
                      color: HexColor('#F7F7F7'),
                      isFilled: false),
                  SizedBox(
                    height: 5.h,
                  ),
                  EditProfileWidget.commomText('Mobile Number',
                      isMandatory: true),
                  customTextField(
                      controller: editCntrl.phoneCntrl.value,
                      focusNode: editCntrl.phoneFocus.value,
                      hintText: 'Enter Mobile Number',
                      isBorder: true,
                      color: HexColor('#F7F7F7'),
                      isFilled: false,
                      isForCountryCode: true),
                  SizedBox(
                    height: 5.h,
                  ),
                  EditProfileWidget.commomText('Permanent Address'),
                  customTextField(
                      controller: editCntrl.permanentAddCntrl.value,
                      focusNode: editCntrl.permanentFocus.value,
                      hintText: 'Type Here...',
                      isBorder: true,
                      color: HexColor('#F7F7F7'),
                      isFilled: false,
                      maxLines: 3),
                  SizedBox(
                    height: 5.h,
                  ),
                  EditProfileWidget.commomText('Pincode', isMandatory: true),
                  customTextField(
                      controller: editCntrl.pinNoCntrl.value,
                      focusNode: editCntrl.pinNoFocus.value,
                      hintText: 'Type Here...',
                      isBorder: true,
                      color: HexColor('#F7F7F7'),
                      isFilled: false),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          EditProfileWidget.commomText('City'),
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
                          EditProfileWidget.commomText('State'),
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
                        Get.to(() => LandlordDocView());
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
