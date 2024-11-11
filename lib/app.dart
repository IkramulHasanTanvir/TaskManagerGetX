import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_get_x/UI/screens/otp_verify/otp_verify_screen.dart';
import 'package:task_manager_get_x/UI/screens/sing_in/sing_in_screen.dart';
import 'package:task_manager_get_x/UI/screens/sing_up/sing_up_screen.dart';
import 'package:task_manager_get_x/UI/screens/splash/splash_screen.dart';
import 'package:task_manager_get_x/UI/screens/update_password/update_password_screen.dart';
import 'package:task_manager_get_x/UI/screens/verification_email/verification_email_screen.dart';

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme: _buildInputDecorationTheme(),
        elevatedButtonTheme: _buildElevatedButtonThemeData(),
      ),
      initialRoute: SplashScreen.name,
      routes: {
        SplashScreen.name: (context) => const SplashScreen(),
        SingInScreen.name: (context) => const SingInScreen(),
        SingUpScreen.name: (context) => const SingUpScreen(),
        UpdatePasswordScreen.name: (context) => const UpdatePasswordScreen(),
        VerificationEmailScreen.name: (context) => const VerificationEmailScreen(),
        OtpScreen.name: (context) => const OtpScreen(),
      },
    );
  }

  ElevatedButtonThemeData _buildElevatedButtonThemeData() {
    return ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[600],
          foregroundColor: Colors.grey[300],
          fixedSize: const Size.fromWidth(double.maxFinite),
        ),
      );
  }

  InputDecorationTheme _buildInputDecorationTheme() {
    return InputDecorationTheme(
      labelStyle: const TextStyle(color: Colors.grey),
      border: _buildOutlineInputBorder(),
      focusedBorder: _buildOutlineInputBorder(),
      enabledBorder: _buildOutlineInputBorder(),
      errorBorder: _buildOutlineInputBorder(),
      focusedErrorBorder: _buildOutlineInputBorder(),
      disabledBorder: _buildOutlineInputBorder(),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Colors.grey.shade100),
    );
  }
}
