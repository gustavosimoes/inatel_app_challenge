import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:get/get.dart';
import 'package:inatel_app_challenge/core/colors.dart';
import 'package:inatel_app_challenge/pages/home/home_controller.dart';
import 'package:inatel_app_challenge/pages/home/widgets/metric_container.dart';

class TestsPage extends StatelessWidget {
  HomeController controller;
  TestsPage(this.controller);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        color: ColorsApp.colorsList[3],
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 25),
            Text(
              'Teste de Velocidade',
              style: TextStyle(color: ColorsApp.colorsList[2], fontSize: 25),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  color: ColorsApp.colorsList[2],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    MetricContainer(
                      icon: Icon(
                        Icons.download_outlined,
                        color: ColorsApp.colorsList[3],
                      ),
                      alignmentGeometry: Alignment.center,
                      color: ColorsApp.colorsList[4],
                      title: 'Taxa de Download',
                      metric: controller.transferRateDownload.value.toString(),
                    ),
                    SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedCircularChart(
                          key: controller.chartKey,
                          size: const Size(150.0, 150.0),
                          initialChartData: controller.dataChart,
                          chartType: CircularChartType.Radial,
                          labelStyle: TextStyle(
                              fontSize: 25,
                              color: ColorsApp.colorsList[3],
                              fontWeight: FontWeight.bold),
                          holeLabel:
                              '${controller.percent.value.toStringAsFixed(2)} %',
                        ),
                        SizedBox(width: 50),
                        TextButton(
                          onPressed: () => controller.speedTestIsRunning.value
                              ? null
                              : controller.startUploadTesting(),
                          child: Container(
                            alignment: Alignment.center,
                            width: 50,
                            height: 50,
                            child: controller.speedTestIsRunning.value
                                ? Icon(
                                    Icons.stop_rounded,
                                    size: 30,
                                    color: ColorsApp.colorsList[2],
                                  )
                                : Icon(
                                    Icons.arrow_right_sharp,
                                    size: 50,
                                    color: ColorsApp.colorsList[2],
                                  ),
                            decoration: BoxDecoration(
                              color: ColorsApp.colorsList[3],
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50),
                    MetricContainer(
                      icon: Icon(
                        Icons.upload_outlined,
                        color: ColorsApp.colorsList[3],
                      ),
                      alignmentGeometry: Alignment.center,
                      color: ColorsApp.colorsList[0],
                      title: 'Taxa de Upload',
                      metric: controller.transferRateUpload.value.toString(),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Teste de Latência',
              style: TextStyle(color: ColorsApp.colorsList[2], fontSize: 25),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorsApp.colorsList[2],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Wrap(
                  spacing: 5,
                  runSpacing: 5,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () => controller.latencyTestIsRunning.value
                          ? null
                          : controller.startPingTest(),
                      child: Container(
                        alignment: Alignment.center,
                        width: 50,
                        height: 50,
                        child: controller.latencyTestIsRunning.value
                            ? Icon(
                                Icons.stop_rounded,
                                size: 30,
                                color: ColorsApp.colorsList[2],
                              )
                            : Icon(
                                Icons.arrow_right_sharp,
                                size: 50,
                                color: ColorsApp.colorsList[2],
                              ),
                        decoration: BoxDecoration(
                          color: ColorsApp.colorsList[3],
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    MetricContainer(
                      icon: Icon(
                        Icons.access_time_outlined,
                        color: ColorsApp.colorsList[3],
                      ),
                      title: 'Taxa de Latência',
                      metric: controller?.pingData?.value?.response?.time ==
                              null
                          ? '0.0 ms'
                          : '${((controller.pingData.value.response.time.inMicroseconds) / 1000).toString()} ms',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
