import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:inatel_app_challenge/core/colors.dart';
import 'package:inatel_app_challenge/pages/home/home_controller.dart';

class TabNavigation extends StatelessWidget {
  HomeController controller;
  TabNavigation(this.controller);
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: 1,
      height: 50,
      animationDuration: Duration(milliseconds: 1000),
      color: ColorsApp.colorsList[2],
      backgroundColor: ColorsApp.colorsList[3],
      animationCurve: Curves.fastLinearToSlowEaseIn,
      buttonBackgroundColor: ColorsApp.colorsList[3],
      items: <Widget>[
        Icon(
          Icons.wifi,
          size: 30,
          color: controller.indexPageSelect.value == 0
              ? ColorsApp.colorsList[2]
              : ColorsApp.colorsList[3],
        ),
        Icon(
          Icons.compare_arrows,
          size: 30,
          color: controller.indexPageSelect.value == 1
              ? ColorsApp.colorsList[2]
              : ColorsApp.colorsList[3],
        ),
        Icon(
          Icons.info_outline,
          size: 30,
          color: controller.indexPageSelect.value == 2
              ? ColorsApp.colorsList[2]
              : ColorsApp.colorsList[3],
        ),
      ],
      onTap: (index) {
        controller.indexPageSelect.value = index;
      },
    );
  }
}
