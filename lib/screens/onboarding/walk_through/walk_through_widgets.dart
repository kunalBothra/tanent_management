import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tanent_management/common/constants.dart';
import 'package:tanent_management/common/text_styles.dart';
import 'package:tanent_management/screens/onboarding/walk_through/walk_through_controller.dart';

class WalkThroughWidget{
  //variables

  //functions
  static pageViewWidget(){
    final walkCntrl = Get.find<WalkThroughController>();
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 420.h,
            width: Get.width,
            decoration: BoxDecoration(
              // color: HexColor('#050505'),
              borderRadius: BorderRadius.circular(10.r)
            ),
            child: Stack(
              children: [
                PageView(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  controller: walkCntrl.pageController.value,
                  children: [
                    walkThroughImage,
                    walkThroughImage,
                    walkThroughImage,
                    walkThroughImage,
                    walkThroughImage,

                  ],
                ),
                Positioned(
                  bottom: 20.h,
                  right: Get.width/2.5,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 20.h),
                    child: SmoothPageIndicator(
                      controller: walkCntrl.pageController.value,
                      count: 4,
                      effect:  SlideEffect(
                          dotWidth: 14,
                          dotHeight: 14,
                          dotColor: HexColor('#EBEBEB'),
                          activeDotColor: HexColor('#679BF1')),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text('Let’s Find Your Sweet & Dream Place',style: CustomStyles.otpStyle050505.copyWith(fontSize: 24.sp),),
          SizedBox(height: 5.h,),
          Text('Find Your Dream Place Just a Few Clicks.',style: CustomStyles.desc606060,),
          SizedBox(height: 10.h,),

        ],
      ),
    );
  }


}