import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inatel_app_challenge/pages/home/home_binding.dart';

import 'routes/app_pages.dart';
import 'routes/app_routes.dart';

class AppModule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: HomeBinding(),
      initialRoute: Routes.HOME,
      getPages: AppPages.routes,
    );
  }
}
