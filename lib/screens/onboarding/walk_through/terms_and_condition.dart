import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tanent_management/common/text_styles.dart';
import 'package:tanent_management/common/widgets.dart';
import 'package:tanent_management/screens/onboarding/walk_through/walk_through_controller.dart';

class TermsAndConditionScreen extends StatelessWidget {
   TermsAndConditionScreen({super.key});
   final cntrl = Get.find<WalkThroughController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // resizeToAvoidBottomInset:false,

        appBar: AppBar(title:
        Text('Terms and Conditions',style: CustomStyles.otpStyle050505,),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          primary: false,
          centerTitle: true
          ,leading: Container(),),

        body: Column(
          children: [
            Divider(color: HexColor('#EBEBEB'),),
            Expanded(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.w,),
                child: ListView(
                  physics:const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    SizedBox(height: 15.h,),
                    Text('2. Information Collection and Use',style: CustomStyles.otpStyle050505.copyWith(fontSize: 16.sp),),
                    SizedBox(height: 10.h,),
                    Text('''The App collects personal information from users when they register to use the service, add tenants, or update tenant information.\nPersonal information may include names, email addresses, phone numbers, addresses, lease dates, rent amounts, and emergency contact information.\nThe App may also collect non-personal identification information about users whenever they interact with the application. Non-personal identification information may include the browser name, the type of computer or device, and technical information about users' means of connection to the App.''',
                      style: CustomStyles.desc606060.copyWith(fontSize: 14.sp,height: 1.5.h),),
                    SizedBox(height: 15.h,),
                    Text('3. How We Use Collected Information',style: CustomStyles.otpStyle050505.copyWith(fontSize: 16.sp),),
                    SizedBox(height: 10.h,),
                    Text('''Personal information collected from users is used to manage tenant information, process transactions, and send periodic emails regarding updates, announcements, or other information related to the service.\nNon-personal identification information may be used to improve the App, personalize user experience, and analyze usage trends.''',
                      style: CustomStyles.desc606060.copyWith(fontSize: 14.sp, height: 1.5.h),),
              
              
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Obx(
                   () {
                    return Checkbox(value: cntrl.checkboxValue.value, onChanged: (value){
                      cntrl.onCheckBoxClicked(value);
                    });
                  }
                ),
                Text('I agree and Continue',style: CustomStyles.desc606060.copyWith(fontSize: 16.sp),),

              ],
            ),
            SizedBox(height: 15.h,),
            Padding(padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: customButton(onPressed: (){
              cntrl.onNextClicked();
            },width: Get.width, text: 'Next'),
            ),

            SizedBox(
              height: 15.h,
            ),
          ],
        ),
      ),
    );
  }
}
