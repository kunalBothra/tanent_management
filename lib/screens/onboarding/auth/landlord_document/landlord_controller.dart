import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LandlordDocController extends GetxController{
  final aadharCntrl = TextEditingController().obs;
  final govIdCntrl = TextEditingController().obs;
  final otherDocCntrl = TextEditingController().obs;

  final  aadharFocus = FocusNode().obs;
  final  govIdFocus = FocusNode().obs;
  final  otherDocFocus = FocusNode().obs;

  final profileImage = Rxn<dynamic>().obs;
  final imageFile =Rxn<File>().obs;


}