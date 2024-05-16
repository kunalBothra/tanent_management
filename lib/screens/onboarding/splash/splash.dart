import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tanent_management/screens/navbar/navbar_view.dart';
import 'package:tanent_management/screens/onboarding/splash/splash_controller.dart';
import 'package:tanent_management/screens/profile/my_profile/my_profile_view.dart';
import '../../../common/constants.dart';
import '../auth/login_view/sign_in.dart';
import '../walk_through/walk_through.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});

  final onboardCntrl = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                height: 125.h,
                width: 125.w,
                child: AnimatedSplashScreen(
                  duration: 1700,
                  splashIconSize: 150.h,
                  splash: splashImage,
                  nextScreen: Obx(
                     () {
                      return onboardCntrl.isgoThroughVisible.value!
                          ? WalkThroughScreen()
                          : onboardCntrl.userData.value != null
                          ? const NavBar(initialPage: 0,)
                          // :SignInScreen();
                       : SignInScreen();
                    }

                  ), // SignInScreen(),
                  splashTransition: SplashTransition.fadeTransition,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
