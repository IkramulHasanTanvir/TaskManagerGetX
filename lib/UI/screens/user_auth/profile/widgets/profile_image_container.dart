import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_get_x/UI/screens/user_auth/profile/view_model/profile_update_controller.dart';
import 'package:task_manager_get_x/data/data_controller/auth_controller.dart';

class ProfileImageContainer extends StatefulWidget {
  const ProfileImageContainer({super.key});

  @override
  State<ProfileImageContainer> createState() => _ProfileImageContainerState();
}

class _ProfileImageContainerState extends State<ProfileImageContainer> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileUpdateController>(builder: (controller) {
      return InkWell(
        onTap: controller.pickImage,
        child: Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[600],
          ),
          child: CircleAvatar(
            backgroundColor: Colors.grey[200],
            maxRadius: 54,
            backgroundImage: controller.selectedImage != null
                ? FileImage(controller.selectedImage!)
                : (AuthController.userData?.photo != null &&
                        AuthController.userData!.photo!.isNotEmpty)
                    ? NetworkImage(AuthController.userData!.photo!)
                        as ImageProvider
                    : null,
            child: (controller.selectedImage == null &&
                    (AuthController.userData?.photo == null ||
                        AuthController.userData!.photo!.isEmpty))
                ? Icon(
                    Icons.person,
                    size: 98,
                    color: Colors.grey[400],
                  )
                : null,
          ),
        ),
      );
    });
  }
}
