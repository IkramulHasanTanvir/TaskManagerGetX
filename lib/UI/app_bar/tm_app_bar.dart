import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_get_x/UI/screens/user_auth/profile/profile_update_screen.dart';
import 'package:task_manager_get_x/UI/screens/user_auth/sing_in/sing_in_screen.dart';
import 'package:task_manager_get_x/data/data_controller/auth_controller.dart';

class TmAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TmAppBar({super.key, this.isProfile = true});

  final bool isProfile;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey[700],
      title: isProfile
          ? ListTile(
              onTap: () {
                Get.toNamed(ProfileUpdateScreen.name);
              },
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                backgroundColor: Colors.grey[200],
                radius: 30,
                backgroundImage: const NetworkImage(''),
                child: Icon(
                  Icons.person,
                  size: 44,
                  color: Colors.grey[400],
                ),
              ),
              title: const Text(
                'Tanvir Hridoy',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: const Text(
                'tanvirhridoy@gmail.com',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              trailing: IconButton(
                  onPressed: () async {
                    await AuthController.clearAccessToken();
                    Get.offAllNamed(SingInScreen.name);
                  },
                  icon: const Icon(Icons.logout)),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
