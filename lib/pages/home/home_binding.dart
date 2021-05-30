import 'package:get/get.dart';
import 'package:inatel_app_challenge/pages/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
