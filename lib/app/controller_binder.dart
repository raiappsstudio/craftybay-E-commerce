import 'package:craftybay/core/network_caller/network_caller.dart';
import 'package:craftybay/features/auth/ui/controllers/sign_up_controller.dart';
import 'package:craftybay/features/common/controllers/main_bottom_nav_bar_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavBarController());
    Get.put(NetworkCaller());
    Get.put(SignUpController());
  }
}