import 'dart:convert';
import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_manager_get_x/UI/screens/user_auth/profile/model/user_data_model.dart';
import 'package:task_manager_get_x/data/data_controller/auth_controller.dart';
import 'package:task_manager_get_x/data/models/network_response.dart';
import 'package:task_manager_get_x/data/services/network_caller.dart';
import 'package:task_manager_get_x/data/utils/urls.dart';

class ProfileUpdateController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;
  String? _successMessage;
  XFile? _selectedImage;

  bool get inProgress => _inProgress;

  File? get selectedImage =>
      _selectedImage != null ? File(_selectedImage!.path) : null;

  String? get errorMessage => _errorMessage;

  String? get successMessage => _successMessage;

  Future<bool> updateProfile(
    String email,
    String firstName,
    String lastName,
    String mobile,
    String password,
  ) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    Map<String, dynamic> requestBody = {
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      "mobile": mobile,
    };

    if (password.isNotEmpty) {
      requestBody['password'] = password;
    }

    if (_selectedImage != null) {
      File imageFile = File(_selectedImage!.path);
      List<int>? compressedImageBytes =
          await FlutterImageCompress.compressWithFile(
        imageFile.path,
        minWidth: 200, // Adjust as needed
        minHeight: 200,
        quality: 85,
      );

      if (compressedImageBytes != null) {
        String base64Image = base64Encode(compressedImageBytes);
        requestBody['photo'] = base64Image;
      }
    }

    NetworkResponse networkResponse = await NetworkCaller.postRequest(
      url: Urls.profileUpdate,
      body: requestBody,
    );

    if (networkResponse.isSuccess) {
      final UserData userData = UserData.fromJson(requestBody);
      await AuthController.saveUserData(userData);
      _successMessage = 'Profile updated';
      Get.back();
      isSuccess = true;
    } else {
      _errorMessage = networkResponse.errorMassage;
    }

    _inProgress = false;
    update();
    return isSuccess;
  }

  Future<void> pickImage() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      _selectedImage = pickedImage;
    }
    update();
  }
}
