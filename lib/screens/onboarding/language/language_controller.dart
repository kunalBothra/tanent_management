import 'package:get/get.dart';
import 'package:tanent_management/common/constants.dart';
import 'package:tanent_management/screens/onboarding/walk_through/terms_and_condition.dart';

class LanguageController extends GetxController{
  //variables
  final languageList = <Map>[
    {
      'name':'English',
      'icon':engFlagIcon,
      'isSelected': true
    },
    {
      'name':'Hindi',
      'icon':hindiFlagIcon,
      'isSelected': false
    },
  ].obs;

  //functions
  onLanguageChange(index){
    languageList.map((element) {
      element['isSelected']=false;
    } ).toList();
    languageList[index]['isSelected']=true;
    languageList.refresh();
  }

  onContinueTap({required bool isFromProfile}){
    isFromProfile?Get.back(): Get.to(()=> TermsAndConditionScreen());
  }
}