// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:qurani_cures_p/dua.dart';
import 'package:qurani_cures_p/splash_view.dart';
import 'package:qurani_cures_p/test.dart';

import 'category.dart';
import 'dbhelper.dart';

void main() {
  runApp(const MyApp());
} //ye screens dkhain
//yahn detail shoe honi
//db open kro

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
