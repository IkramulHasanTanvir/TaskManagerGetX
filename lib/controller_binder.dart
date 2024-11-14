import 'package:get/get.dart';
import 'package:task_manager_get_x/UI/screens/user_auth/sing_in/view_model/sing_in_controller.dart';
import 'package:task_manager_get_x/UI/screens/user_task/add_new/view_model/add_new_controller.dart';
import 'package:task_manager_get_x/UI/screens/user_task/new/view_model/new_task_controller.dart';
import 'package:task_manager_get_x/UI/task/view_model/task_delete_controller.dart';
import 'package:task_manager_get_x/UI/task/view_model/task_update_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(SingInController());
    Get.put(NewTaskController());
    Get.put(TaskDeleteController());
    Get.put(AddNewController());
    Get.put(TaskUpdateController());
  }

}