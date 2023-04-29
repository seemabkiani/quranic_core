import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:qurani_cures_p/category.dart';
import 'package:qurani_cures_p/dboard.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () => Get.to(const DashBoard()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(126, 193, 68, 68),
      body: Center(
        child: Image.asset(
          'image/img.jpg',
        ),
      ),
    );
  }
}
