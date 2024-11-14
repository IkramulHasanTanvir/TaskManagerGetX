import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_get_x/UI/screens/user_auth/profile/profile_update_screen.dart';

class TmAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TmAppBar({super.key, this.isProfile = true});

  final bool isProfile;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey[300],
      title: isProfile
          ? ListTile(
              onTap: () {
                Get.to(() => const ProfileUpdateScreen());
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
                style: TextStyle(color: Colors.black),
              ),
              subtitle: const Text('tanvirhridoy@gmail.com'),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}