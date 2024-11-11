import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_get_x/UI/screens/sing_in/sing_in_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static String name = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _moveNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offAllNamed(SingInScreen.name);
  }

  @override
  void initState() {
    super.initState();
    _moveNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Icon(
          Icons.task_rounded,
          size: 104,
          color: Colors.grey[600],
        ),
      ),
    );
  }
}
