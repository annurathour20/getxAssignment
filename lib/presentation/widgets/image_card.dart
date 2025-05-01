import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/app_pages.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageCard extends StatelessWidget {
  final Map<String, dynamic> article;
  const ImageCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final String imageUrl = article['image_url'] ?? '';
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.expanded, arguments: imageUrl),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        placeholder: (_, __) => Center(child: CircularProgressIndicator()),
        errorWidget: (_, __, ___) => Icon(Icons.error),
      ),
    );
  }
}
