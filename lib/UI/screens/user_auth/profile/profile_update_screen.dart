import 'package:flutter/material.dart';
import 'package:task_manager_get_x/UI/app_bar/tm_app_bar.dart';
import 'package:task_manager_get_x/common/utils/app_padding.dart';

class ProfileUpdateScreen extends StatefulWidget {
  const ProfileUpdateScreen({super.key});

  static String name = '/profile';

  @override
  State<ProfileUpdateScreen> createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: const TmAppBar(
        isProfile: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.authScreenSidePadding,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Update Profile',
                  style: textTheme.displayMedium,
                ),
                SizedBox(height: size.height * 0.026),
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[600],
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    maxRadius: 54,
                    backgroundImage: const NetworkImage(''),
                    child: Icon(
                      Icons.person,
                      size: 98,
                      color: Colors.grey[400],
                    ),
                  ),
                ),
                _buildFormSection(size),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormSection(size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: size.height * 0.026),
        TextFormField(
          controller: _emailTEController,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            labelText: 'Email',
          ),
        ),
        SizedBox(height: size.height * 0.010),
        TextFormField(
          controller: _firstNameTEController,
          decoration: const InputDecoration(
            labelText: 'First Name',
          ),
        ),
        SizedBox(height: size.height * 0.010),
        TextFormField(
          controller: _lastNameTEController,
          decoration: const InputDecoration(
            labelText: 'Last Name',
          ),
        ),
        SizedBox(height: size.height * 0.010),
        TextFormField(
          controller: _mobileTEController,
          keyboardType: TextInputType.phone,
          decoration: const InputDecoration(
            labelText: 'Mobile',
          ),
        ),
        SizedBox(height: size.height * 0.010),
        TextFormField(
          controller: _passwordTEController,
          obscureText: true,
          decoration: const InputDecoration(
            labelText: 'Password',
          ),
        ),
        SizedBox(height: size.height * 0.036),
        ElevatedButton(
          onPressed: _onTapNextScreen,
          child: const Text('Save'),
        ),
        SizedBox(height: size.height * 0.046),
      ],
    );
  }

  void _onTapNextScreen() {}

  @override
  void dispose() {
    super.dispose();
    _emailTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _passwordTEController.dispose();
  }
}
