import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tanent_management/common/constants.dart';
import 'package:tanent_management/screens/profile/documents/document_controller.dart';
import 'package:tanent_management/screens/profile/documents/document_widgets.dart';

import '../../../common/text_styles.dart';

class DocumentScreen extends StatelessWidget {
   DocumentScreen({super.key});

    final docCntrl = Get.put(DocumentController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text('Document', style: CustomStyles.skipBlack)),
      body: Column(
        children: [
          Divider(height: 1.h,color: HexColor('#EBEBEB'),),
          SizedBox(height: 20.h,),
          Padding( padding:  EdgeInsets.symmetric(horizontal: 16.w,),
          child:
              DocumentWidgets().documentList(),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
            child: Row(
              children: [
                addIcon,
                Text('Add Document(s)',style: CustomStyles.black16.copyWith(fontSize: 16.sp,fontWeight: FontWeight.w500,fontFamily: 'Inter'),),
              ],
            ),
          )

        ],
      ),
    ));
  }
}
