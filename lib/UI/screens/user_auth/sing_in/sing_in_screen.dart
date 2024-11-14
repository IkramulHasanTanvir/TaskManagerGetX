import 'package:flutter/material.dart';
import 'package:task_manager_get_x/UI/screens/user_auth/sing_in/widgets/forgot_account.dart';
import 'package:task_manager_get_x/UI/screens/user_auth/sing_in/widgets/sing_in_form.dart';
import 'package:task_manager_get_x/common/utils/app_padding.dart';

class SingInScreen extends StatefulWidget {
  const SingInScreen({super.key});

  static String name = '/SingIn';

  @override
  State<SingInScreen> createState() => _SingInScreenState();
}

class _SingInScreenState extends State<SingInScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.authScreenSidePadding,
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SingInFormSection(),
              ForgotAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
