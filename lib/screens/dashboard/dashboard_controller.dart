import 'package:get/get.dart';
import 'package:tanent_management/screens/dashboard/add_property/add_property_view.dart';
import 'package:tanent_management/screens/dashboard/tenant/add_tenant/add_tenant_view.dart';
import 'package:tanent_management/screens/expense/add_expense/add_expense_view.dart';

class DashBoardController extends GetxController{
  //variables
  final isAddTap = false.obs;


  //functions
  onFloatingButtonAddTap(){
    isAddTap.value=true;
  }
  onFloatingButtonCrossTap(){
    isAddTap.value=false;
  }
  onAddPropertyTap(){
    isAddTap.value=false;
   Get.to(()=>AddPropertyScreen());
  }

  onAddTenantTap(){
    isAddTap.value=false;
   Get.to(()=>AddTenantScreen());
  }

  onAddExpenseTap(){
    isAddTap.value=false;
   Get.to(()=>AddExpenseScreen());
  }
}