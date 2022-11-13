import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_tutorials/View/posts/home_screen.dart';

import '../View/auth/auth.dart';

import 'package:flutter/material.dart';

class SplashServices {
  isLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;

    final user = auth.currentUser;

    if (user != null) {
      Timer(
          const Duration(seconds: 4),
          () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => const HomeScreen())));
    } else {
      Timer(
          const Duration(seconds: 4),
          () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => const LoginScreen())));
    }
  }
}
