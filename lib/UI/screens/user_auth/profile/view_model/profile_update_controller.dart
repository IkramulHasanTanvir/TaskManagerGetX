import 'package:get/get.dart';
import 'package:task_manager_get_x/UI/screens/user_auth/profile/model/user_data_model.dart';
import 'package:task_manager_get_x/data/data_controller/auth_controller.dart';
import 'package:task_manager_get_x/data/models/network_response.dart';
import 'package:task_manager_get_x/data/services/network_caller.dart';
import 'package:task_manager_get_x/data/utils/urls.dart';

class ProfileUpdateController extends GetxController {
  bool get inProgress => _inProgress;

  bool _inProgress = false;

  String? _errorMessage;

  String? _successMessage;

  String? get errorMessage => _errorMessage;

  String? get successMessage => _successMessage;

  Future<bool> updateProfile(String email, String firstName, String lastName,
      String mobile, String password, String photo) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    Map<String, dynamic> requestBody = {
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      "mobile": mobile,
      "password": password
    };
    if (password != '') {
      requestBody['password'] = password;
    }
    if (photo != '') {
      requestBody['photo'] = photo;
    }

    NetworkResponse networkResponse = await NetworkCaller.postRequest(
      url: Urls.profileUpdate,
      body: requestBody,
    );
    if (networkResponse.isSuccess) {
      final UserData userData = UserData.fromJson(
        networkResponse.responseBody,
      );
      await AuthController.saveUserData(userData);
      isSuccess = true;
      _successMessage = 'Profile updated';
    } else {
      _errorMessage = networkResponse.errorMassage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
