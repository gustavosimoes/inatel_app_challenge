import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:inatel_app_challenge/core/colors.dart';
import 'package:inatel_app_challenge/core/widgets/tab_bar/tab_bar.dart';
import 'package:inatel_app_challenge/pages/home/home_controller.dart';
import 'package:inatel_app_challenge/pages/pages/not_connection_page.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.speed,
                    color: ColorsApp.colorsList[3],
                    size: 30,
                  ),
                  SizedBox(width: 25),
                  Text(
                    'SpeedTest',
                    style: TextStyle(
                      color: ColorsApp.colorsList[3],
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            backgroundColor: ColorsApp.colorsList[2],
          ),
          body: controller.hasConnection.value
              ? controller.pageSelect()
              : NotConnectionPage(),
          bottomNavigationBar: TabNavigation(controller),
        ));
  }
}
