import 'package:get/get.dart';
import 'package:task_manager_get_x/data/models/network_response.dart';
import 'package:task_manager_get_x/data/services/network_caller.dart';
import 'package:task_manager_get_x/data/utils/urls.dart';

class OTPVerifyController extends GetxController {
  bool _inProgress = false;

  String? _successMessage;

  String? _errorMessage;

  bool get inProgress => _inProgress;

  String? get errorMessage => _errorMessage;

  String? get  successMessage => _successMessage;

  Future<bool> otpVerify(String email,String otp) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    NetworkResponse networkResponse = await NetworkCaller.getRequest(
      url: Urls.recoverVerifyOtp(email,otp),
    );
    if (networkResponse.isSuccess) {
      isSuccess = true;
      _successMessage = 'Set new password';
    } else {
      _errorMessage = networkResponse.errorMassage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}