import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class PersonlInfoWidget{

  static   commomText(String title, {bool isMandatory=false,TextStyle? style,Widget? icon }){
    return Padding(
      padding:  EdgeInsets.only(top: 5.h,bottom: 5.h),
      child:icon!=null? isMandatory? Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(title,style:style?? TextStyle(fontFamily: 'Inter', color: HexColor('#111111'),fontSize: 16.sp)),
              Text('*',style: style??TextStyle(fontFamily: 'Inter', color: HexColor('#EF5E4E'),fontSize: 16.sp)),
            ],
          ),
          icon
        ],
      ): Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style:style?? TextStyle(fontFamily: 'Inter', color: HexColor('#111111'),fontSize: 16.sp)),
          icon
        ],
      ):
      Text(title,style:style?? TextStyle(fontFamily: 'Inter', color: HexColor('#111111'),fontSize: 16.sp)),
    );
  }
}