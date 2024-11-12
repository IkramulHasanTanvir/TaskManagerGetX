import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_get_x/UI/screens/sing_up/sing_up_screen.dart';
import 'package:task_manager_get_x/common/utils/app_padding.dart';
import 'package:task_manager_get_x/UI/screens/verification_email/verification_email_screen.dart';

class SingInScreen extends StatefulWidget {
  const SingInScreen({super.key});

  static String name = '/SingIn';

  @override
  State<SingInScreen> createState() => _SingInScreenState();
}

class _SingInScreenState extends State<SingInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.authScreenSidePadding,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildFormSection(),
              _buildForgotAccountSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormSection() {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Size size = MediaQuery.sizeOf(context);
    return Form(
      key: _globalKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Get Start With',
            style: textTheme.displayMedium,
          ),
          SizedBox(height: size.height * 0.016),
          TextFormField(
            controller: _emailTEController,
            keyboardType: TextInputType.emailAddress,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
            validator: (value) {
              if (value!.trim().isEmpty) {
                return 'Enter valid value';
              }
              return null;
            },
          ),
          SizedBox(height: size.height * 0.010),
          TextFormField(
            controller: _passwordTEController,
            keyboardType: TextInputType.emailAddress,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              labelText: 'Password',
            ),
            validator: (value) {
              if (value!.length < 6) {
                return 'Enter value a minimum 6 character';
              }
              return null;
            },
          ),
          SizedBox(height: size.height * 0.026),
          ElevatedButton(
            onPressed: _onTapNextScreen,
            child: const Text('Sing In'),
          ),
          SizedBox(height: size.height * 0.016),
        ],
      ),
    );
  }

  Widget _buildForgotAccountSection() {
    return Center(
      child: Column(children: [
        TextButton(
          onPressed: () {
            Get.to(() => const VerificationEmailScreen());
          },
          child: Text(
            'Forgot Password?',
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
        ),
        RichText(
          text: TextSpan(
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.w600,
              ),
              children: [
                const TextSpan(
                  text: "Don't have account?  ",
                ),
                TextSpan(
                    style: TextStyle(
                      color: Colors.grey[900],
                    ),
                    text: 'Sing Up',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.toNamed(SingUpScreen.name);
                      }),
              ]),
        ),
      ]),
    );
  }

  void _onTapNextScreen() {
    if (!_globalKey.currentState!.validate()) {
      return;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _emailTEController.dispose();
    _passwordTEController.dispose();
  }
}
