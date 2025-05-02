import 'package:assignment/presentation/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'presentation/routes/app_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Constant.newsImageApp,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: AppRoutes.splash,
      getPages: AppPages.pages,
    );
  }
}
