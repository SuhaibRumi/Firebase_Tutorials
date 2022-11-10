import 'dart:async';
import '../View/view.dart';
import 'package:flutter/material.dart';

class SplashServices {
  isLogin(BuildContext context) {
    Timer(
        const Duration(seconds: 4),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => const LoginScreen())));
  }
}
