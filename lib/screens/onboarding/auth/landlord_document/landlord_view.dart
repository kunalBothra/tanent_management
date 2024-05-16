import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tanent_management/screens/onboarding/auth/landlord_document/landlord_controller.dart';
import 'package:tanent_management/screens/onboarding/auth/landlord_document/landlord_widget.dart';

import '../../../../common/text_styles.dart';
import '../../../../common/widgets.dart';

class LandlordDocView extends StatelessWidget {
   LandlordDocView({super.key});

  final landlordDocCntrl = Get.put(LandlordDocController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Landlord Documents', style: CustomStyles.otpStyle050505),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: HexColor('#679BF1'),
              height: 5.h,
              width: Get.width,
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              child: ListView(
                children: [
                  LandlordDocWidget.commomText(
                      'Submit essential photos/documents for smooth landlord-business relationship.',
                      fontsize: 16.sp),
                  LandlordDocWidget.commomText(
                    'Aadhar Card Id',
                  ),
                  customTextField(
                    controller: landlordDocCntrl.aadharCntrl.value,
                      focusNode: landlordDocCntrl.aadharFocus.value,
                      textInputAction: TextInputAction.next,

                      hintText: 'Type Here...',
                      isBorder: true,
                      color: HexColor('#F7F7F7'),
                      isFilled: false),
                  LandlordDocWidget.commonDocUpload(
                      title: 'Upload Aadhar Card'),
                  LandlordDocWidget.commomText(
                    'Government-issued ID Card Number',
                  ),
                  customTextField(
                      controller: landlordDocCntrl.govIdCntrl.value,
                      focusNode: landlordDocCntrl.govIdFocus.value,
                      textInputAction: TextInputAction.next,

                      hintText: 'Type Here...',
                      isBorder: true,
                      color: HexColor('#F7F7F7'),
                      isFilled: false),
                  LandlordDocWidget.commonDocUpload(
                      title: 'Upload Government Card'),
                  LandlordDocWidget.commomText(
                    'Other Documents',
                  ),
                  customTextField(
                      controller: landlordDocCntrl.otherDocCntrl.value,
                      focusNode: landlordDocCntrl.otherDocFocus.value,
                      textInputAction: TextInputAction.done,
                      hintText: 'Type Here...',
                      isBorder: true,
                      color: HexColor('#F7F7F7'),
                      isFilled: false),
                  LandlordDocWidget.commonDocUpload(
                      title: 'Upload Government Card'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customBorderButton('Previous', () {},
                          verticalPadding: 10.h,
                          horizontalPadding: 2.w,
                          btnHeight: 40.h,
                          width: Get.width / 2.3,
                          borderColor: HexColor('#679BF1'),
                          textColor: HexColor('#679BF1')),
                      customBorderButton('Submit', () {},
                          verticalPadding: 10.h,
                          horizontalPadding: 2.w,
                          btnHeight: 40.h,
                          width: Get.width / 2.3,
                          color: HexColor('#679BF1'),
                          textColor: HexColor('#FFFFFF'),
                          borderColor: Colors.transparent)
                    ],
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
