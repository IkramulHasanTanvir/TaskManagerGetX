import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_get_x/UI/screens/home/home_screen.dart';
import 'package:task_manager_get_x/UI/screens/user_auth/sing_in/view_model/sing_in_controller.dart';
import 'package:task_manager_get_x/common/widgets/snack_massage.dart';
import 'package:task_manager_get_x/common/widgets/tm_progress_indicator.dart';

class SingInFormSection extends StatefulWidget {
  const SingInFormSection({super.key});

  @override
  State<SingInFormSection> createState() => _SingInFormSectionState();
}

class _SingInFormSectionState extends State<SingInFormSection> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  final SingInController singInController = Get.find<SingInController>();

  @override
  Widget build(BuildContext context) {
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
          GetBuilder<SingInController>(builder: (controller) {
            return Visibility(
              visible: !controller.inProgress,
              replacement: const TMProgressIndicator(),
              child: ElevatedButton(
                onPressed: _onTapNextScreen,
                child: const Text('Sing In'),
              ),
            );
          }),
          SizedBox(height: size.height * 0.016),
        ],
      ),
    );
  }

  void _onTapNextScreen() {
    if (!_globalKey.currentState!.validate()) {
      return;
    }
    _singIn();
  }

  Future<void> _singIn() async {
    final bool result = await singInController.singIn(
      _emailTEController.text.trim(),
      _passwordTEController.text,
    );
    if (result) {
      Get.offAllNamed(HomeScreen.name);
      snackMassage(false, 'sing in success');
    } else {
      snackMassage(true, singInController.errorMessage!);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _emailTEController.dispose();
    _passwordTEController.dispose();
  }
}
