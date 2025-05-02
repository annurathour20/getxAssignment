import 'package:assignment/presentation/utils/constant.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:get/get.dart';
import '../../routes/app_pages.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// set 1 second timer and then jump on listing page...
    Timer(Duration(seconds: 1), () => Get.offNamed(AppRoutes.listing));
    return Scaffold(
      body: Center(
        child: Text(Constant.landmarkGroup, style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
