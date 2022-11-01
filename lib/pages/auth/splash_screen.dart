import 'dart:async';
import 'package:findlater/pages/components/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/sign_in_provider.dart';
import '../../utils/colors.dart';
import '../../utils/config.dart';
import '../../utils/next_screen.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // init state
  @override
  void initState() {
    final sp = context.read<SignInProvider>();
    super.initState();
    // create a timer of 2 seconds
    Timer(const Duration(seconds: 2), () {
      sp.isSignedIn == false
          ? nextScreen(context, const LoginScreen())
          : nextScreen(context, const BottomNavBar());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
          child: Center(
              child: Image(
                  image: const AssetImage(Config.appIcon),
                  height: MediaQuery.of(context).size.width * 0.18,
                  width: MediaQuery.of(context).size.width * 0.18,
                  fit: BoxFit.cover))),
    );
  }
}
