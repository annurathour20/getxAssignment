import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'presentation/routes/app_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'News Image App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: AppRoutes.splash,
      getPages: AppPages.pages,
    );
  }
}
