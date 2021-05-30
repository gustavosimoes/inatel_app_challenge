import 'package:flutter/material.dart';
import 'package:inatel_app_challenge/core/colors.dart';

class NotConnectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: ColorsApp.colorsList[3],
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(height: 25),
          Text(
            'Sem conexão no momento!',
            style: TextStyle(
                color: ColorsApp.colorsList[2],
                fontSize: 35,
                fontWeight: FontWeight.bold),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Icon(
                Icons.wifi,
                color: ColorsApp.colorsList[2],
                size: 200,
              ),
              Icon(
                Icons.not_interested_outlined,
                color: ColorsApp.colorsList[4],
                size: 350,
              )
            ],
          )
        ]));
  }
}
