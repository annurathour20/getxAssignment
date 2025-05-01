import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../presentation/widgets/image_card.dart';
import '../../../presentation/controllers/news_controller.dart';

class ListingScreen extends StatelessWidget {
  final NewsController controller = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News Grid")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return GridView.builder(
          controller: controller.scrollController,
          padding: EdgeInsets.all(8),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          itemCount: controller.articles.length,
          itemBuilder: (_, index) {
            print('news${controller.articles.length}');
            final article = controller.articles[index];
            return ImageCard(article: article);
          },
        );
      }),
    );
  }
}
