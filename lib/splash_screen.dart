import 'dart:async';

import 'package:flutter/material.dart';
import 'package:share_pre/home_secreen.dart';
import 'package:share_pre/login_screen.dart';
import 'package:share_pre/student_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    isLogin();
    setState(() {});
  }

  void isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isLogin = sp.getBool('isLogin') ?? false;
    String role = sp.getString('role') ?? '';
    String email = sp.getString('email') ?? '';
    if (isLogin) {
      if (role == 'student') {
        Timer(const Duration(seconds: 5), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const StudentScreen()));
        });
      } else if (role == 'student' && email == '') {
        Timer(const Duration(seconds: 5), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginScreen()));
        });
      }
    } else {
      Timer(const Duration(seconds: 5), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Image(
      height: double.infinity,
      fit: BoxFit.fitHeight,
      image: NetworkImage(
          'https://images.pexels.com/photos/2240571/pexels-photo-2240571.jpeg'),
    ));
  }
}
