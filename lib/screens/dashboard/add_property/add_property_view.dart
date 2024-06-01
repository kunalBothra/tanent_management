import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../common/text_styles.dart';

class AddPropertyScreen extends StatelessWidget {
  const AddPropertyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
    appBar:  AppBar(
        centerTitle: true,
        // automaticallyImplyLeading: false,
        title: Text('Add Property', style: CustomStyles.otpStyle050505),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(color:HexColor('#EBEBEB'),height: 1.h,),
        ],
      ),
    ));
  }
}
