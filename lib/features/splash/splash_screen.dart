import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:to_do_app/core/utils/app_constant.dart';
import 'package:to_do_app/features/home/home_screen.dart';
import 'package:to_do_app/features/login/data/user_model.dart';
import 'package:to_do_app/features/login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      nextPage();
    });
  }

  nextPage() {
    UserModel? user = Hive.box<UserModel>(AppConstant.userBox).get(AppConstant.currentUser);
    if (user == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Lottie.asset('assets/animation/Tasks.json')),
    );
  }
}
