import 'package:flutter/material.dart';
import 'package:qurani_cures_p/dboard.dart';
import 'package:qurani_cures_p/dua.dart';
import 'package:qurani_cures_p/splash_view.dart';
import 'package:get/get.dart';
import 'package:qurani_cures_p/surah_view.dart';
import 'package:qurani_cures_p/test.dart';
import 'package:qurani_cures_p/disease.dart';
import 'category.dart';
import 'dbhelper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); //
  // This widget is the root of your application.v
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashView());
  }
}
