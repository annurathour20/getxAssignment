import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class ExpandedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String imageUrl = Get.arguments ?? '';
    return Scaffold(
      appBar: AppBar(),
      body: PhotoView(imageProvider: NetworkImage(imageUrl)),
    );
  }
}
