import 'package:assignment/presentation/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class ExpandedScreen extends StatelessWidget {
  const ExpandedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// get the image url from the agrument bcoz we have passed the url from listing page
    final String imageUrl = Get.arguments ?? '';
    return Scaffold(
      appBar: AppBar(title: Text(Constant.fullViewImage)),
      body: PhotoView(imageProvider: NetworkImage(imageUrl)),

      ///shows image with zoom in/out functionality
    );
  }
}
