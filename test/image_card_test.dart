import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:assignment/presentation/widgets/image_card.dart';
import 'package:assignment/presentation/routes/app_pages.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  testWidgets('ImageCard renders and navigates on tap', (
    WidgetTester tester,
  ) async {
    const testImageUrl = 'https://via.placeholder.com/150';
    String? tappedUrl;

    // Fake GetX route to capture navigation
    await tester.pumpWidget(
      GetMaterialApp(
        getPages: [
          GetPage(
            name: AppRoutes.expanded,
            page:
                () => Scaffold(
                  body: Builder(
                    builder: (context) {
                      tappedUrl = Get.arguments;
                      return Text('Expanded View');
                    },
                  ),
                ),
          ),
        ],
        home: Scaffold(body: ImageCard(imageUrl: testImageUrl)),
      ),
    );

    /// Ensure CachedNetworkImage placeholder renders
    expect(find.byType(CachedNetworkImage), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    /// Tap on the image card
    await tester.tap(find.byType(ImageCard));
    await tester.pumpAndSettle();

    /// Verify navigation happened and argument passed
    expect(find.text('Expanded View'), findsOneWidget);
    expect(tappedUrl, equals(testImageUrl));
  });
}
