import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inatel_app_challenge/core/colors.dart';
import 'package:inatel_app_challenge/pages/home/home_controller.dart';

class MoreInformationPage extends StatelessWidget {
  HomeController controller;
  MoreInformationPage(this.controller);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        color: ColorsApp.colorsList[3],
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 5),
              Container(
                width: double.infinity,
                child: Text(
                  'Informações sobre a Rede',
                  style: TextStyle(
                    color: ColorsApp.colorsList[2],
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorsApp.colorsList[2],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Icon(
                          Icons.wifi,
                          color: ColorsApp.colorsList[3],
                          size: 35,
                        ),
                      ),
                      Container(
                        width: 200,
                        child: Column(
                          children: [
                            Text(
                              controller.geolocationData.value.ip,
                              style: TextStyle(
                                color: ColorsApp.colorsList[3],
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              controller.geolocationData.value.org,
                              style: TextStyle(
                                color: ColorsApp.colorsList[3],
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              controller.geolocationData.value.isp,
                              style: TextStyle(
                                color: ColorsApp.colorsList[3],
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              controller.geolocationData.value.timezone,
                              style: TextStyle(
                                color: ColorsApp.colorsList[3],
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorsApp.colorsList[2],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Icon(
                          Icons.location_on_outlined,
                          color: ColorsApp.colorsList[3],
                          size: 35,
                        ),
                      ),
                      Container(
                        width: 200,
                        child: Column(
                          children: [
                            Text(
                              '${controller.geolocationData.value.countryCode} ${controller.geolocationData.value.country} ',
                              style: TextStyle(
                                color: ColorsApp.colorsList[3],
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '${controller.geolocationData.value.region} ${controller.geolocationData.value.regionName} ',
                              style: TextStyle(
                                color: ColorsApp.colorsList[3],
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              controller.geolocationData.value.city,
                              style: TextStyle(
                                color: ColorsApp.colorsList[3],
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              controller.geolocationData.value.zip,
                              style: TextStyle(
                                color: ColorsApp.colorsList[3],
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '${controller.geolocationData.value.lat} ${controller.geolocationData.value.lon}',
                              style: TextStyle(
                                color: ColorsApp.colorsList[3],
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
