import 'package:assignment/presentation/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../presentation/widgets/image_card.dart';
import '../../../presentation/controllers/news_controller.dart';

class ListingScreen extends StatelessWidget {
  /// create instance of controller to get the value data
  final NewsController controller = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Constant.newsImage)),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        /// showing images in grid view form thru the api
        return GridView.builder(
          controller: controller.scrollController,
          padding: EdgeInsets.all(8),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: (150.0 / 150.0),
          ),
          itemCount: controller.articles.length,
          itemBuilder: (_, index) {
            final imageUrl = controller.articles[index];
            return ImageCard(imageUrl: imageUrl);
          },
        );
      }),
    );
  }
}
