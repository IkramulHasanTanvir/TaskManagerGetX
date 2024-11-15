import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_get_x/UI/screens/user_auth/otp_verify/otp_verify_screen.dart';
import 'package:task_manager_get_x/UI/screens/user_auth/verification_email/view_model/verify_email_controller.dart';
import 'package:task_manager_get_x/common/widgets/snack_massage.dart';

class VerifyEmailForm extends StatefulWidget {
  const VerifyEmailForm({super.key});

  @override
  State<VerifyEmailForm> createState() => _VerifyEmailFormState();
}

class _VerifyEmailFormState extends State<VerifyEmailForm> {
  final TextEditingController _emailTEController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final VerifyEmailController _verifyEmailController =
      Get.find<VerifyEmailController>();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Size size = MediaQuery.sizeOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: size.height * 0.2),
        Text(
          'Your Email',
          style: textTheme.displayMedium,
        ),
        SizedBox(height: size.height * 0.010),
        const Text(
          '  A 6 digit verification pin will send to your email address',
        ),
        SizedBox(height: size.height * 0.036),
        Form(
          key: _globalKey,
          child: TextFormField(
            controller: _emailTEController,
            keyboardType: TextInputType.emailAddress,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Enter valid value';
              }
              return null;
            },
          ),
        ),
        SizedBox(height: size.height * 0.036),
        ElevatedButton(
          onPressed: _onTapNextScreen,
          child: const Text('Next'),
        ),
        SizedBox(height: size.height * 0.046),
      ],
    );
  }

  void _onTapNextScreen() {
    if (!_globalKey.currentState!.validate()) {
      return;
    }
    _verifyEmail();
    Get.to(() => OtpScreen(email: _emailTEController.text,));
  }

  Future<void> _verifyEmail() async {
    final bool result = await _verifyEmailController.verificationEmail(
      _emailTEController.text.trim(),
    );

    if(result){
      snackMassage(false, _verifyEmailController.successMessage!);
    }
    snackMassage(true, _verifyEmailController.errorMessage!);
  }

  @override
  void dispose() {
    super.dispose();
    _emailTEController.dispose();
  }
}
