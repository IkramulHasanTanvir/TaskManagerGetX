import 'package:get/get.dart';
import 'package:task_manager_get_x/UI/screens/user_auth/sing_in/view_model/sing_in_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(SingInController());

  }

}