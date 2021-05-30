import 'package:get/get.dart';
import 'package:inatel_app_challenge/pages/home/home_binding.dart';
import 'package:inatel_app_challenge/pages/home/home_page.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
