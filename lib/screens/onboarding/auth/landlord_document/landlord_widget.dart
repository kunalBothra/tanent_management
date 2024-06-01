import 'dart:developer';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_pickers/image_pickers.dart';
import 'package:tanent_management/common/constants.dart';
import 'package:tanent_management/screens/onboarding/auth/landlord_document/landlord_controller.dart';

class LandlordDocWidget {
  final landlordCntrl = Get.put(LandlordDocController());

  static commomText(String title, {double? fontsize}) {
    return Padding(
      padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
      child: Text(title,
          style: TextStyle(
              color: HexColor('#111111'), fontSize: fontsize ?? 14.sp)),
    );
  }

  //Doc Add
  static commonDocUpload({dynamic? image, String? title}) {
   final landlordCntrl= Get.find<LandlordDocController>();

    return InkWell(
      onTap: (){
       LandlordDocWidget(). showSelectionDialog(Get.context!);
      },
      child: Padding(
        padding:  EdgeInsets.only(top: 12.h,bottom: 10.h),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: landlordCntrl.imageFile.value != null
              ? Container(
                  height: 120.h,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: HexColor('#EBEBEB'),
                    borderRadius: BorderRadius.circular(10.r),
                    image: DecorationImage(
                        // image: Image.asset('assets/icons/profile.png').image,
                      image: Image.file(landlordCntrl.imageFile.value!).image,
                        fit: BoxFit.cover),
                  ),
                )
              : Container(
                  height: 120.h,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: HexColor('#EBEBEB'),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      cameraIcon,
                      Text(title!,
                          style: TextStyle(
                              color: HexColor('#606060'), fontSize: 14.sp)),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  //Show Gallery Dialogue
  Future<void>  showSelectionDialog(BuildContext context) {
    return Get.bottomSheet(
        Container(
          width: double.infinity,
          height: 250.h,
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
            color: Colors.black87
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                    child: Text(
                      "Choose one to upload a picture",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14.sp, color: Colors.white),
                    )),
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        selectionCont('Gallery', 'assets/icons/pictures.png', 1),
                        SizedBox(
                          width: 25.w,
                        ),
                        selectionCont('Camera', 'assets/icons/camera.png', 2),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateColor.resolveWith(
                                (states) => Colors.transparent),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Cancel",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14.sp, color: Colors.white),
                      )),
                ),
              ]),
        )
    );
  }

  static selectionCont(
      String selectionTypeStr, String selectionIconStr, int btnTag) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Material(
        color: Colors.black87,
        child: StatefulBuilder(
          builder: (context, setState) => InkWell(
            onTap: () {
              if (btnTag == 1) {
                Navigator.pop(context);
                getFromGallery();
              } else {
                Navigator.pop(context);
                getFromCamera();
              }
            }, // button pressed
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  selectionIconStr,
                  width: 60.0,
                  height: 60.0,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  selectionTypeStr,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


//get from gallery
static  getFromGallery() async {
  final landlordCntrl = Get.find<LandlordDocController>();
    dynamic pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
     landlordCntrl.imageFile.value = File(pickedFile.path);

    } else {
      log("no file selected");
      return null;
    }
  }

  /// Get from Camera
static  getFromCamera() async {
    Media? listImagePaths;

    try {
      listImagePaths = await ImagePickers.openCamera(
          compressSize: 500,
          cropConfig: CropConfig(enableCrop: false, width: 2, height: 1));
      return listImagePaths;
    } catch (e) {
      log(e.toString());
      // return null;
    }
    if (listImagePaths != null) {
      final landlordCntrl = Get.find<LandlordDocController>();

       landlordCntrl.imageFile.value = File(listImagePaths!.path!);

    } else {
      log('no file selected');
    }
  }

}
