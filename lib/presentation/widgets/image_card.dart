import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/app_pages.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageCard extends StatelessWidget {
  final String imageUrl;
  const ImageCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      /// Show full image view on click of any of image card
      onTap: () => Get.toNamed(AppRoutes.expanded, arguments: imageUrl),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        placeholder: (_, __) => Center(child: CircularProgressIndicator()),
        errorWidget: (_, __, ___) => Icon(Icons.error_outline_rounded),
      ),
    );
  }
}
