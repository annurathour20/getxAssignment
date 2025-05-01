import 'package:get/get.dart';
import '../screens/index.dart';

class AppRoutes {
  static const splash = '/';
  static const listing = '/listing';
  static const expanded = '/expanded';
}

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.splash, page: () => SplashScreen()),
    GetPage(name: AppRoutes.listing, page: () => ListingScreen()),
    GetPage(name: AppRoutes.expanded, page: () => ExpandedScreen()),
  ];
}
