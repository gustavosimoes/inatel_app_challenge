import 'package:dart_ping/dart_ping.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:get/get.dart';
import 'package:inatel_app_challenge/core/colors.dart';
import 'package:inatel_app_challenge/core/geolocation_api/geolocation_api.dart';
import 'package:inatel_app_challenge/core/geolocation_api/geolocation_data.dart';
import 'package:inatel_app_challenge/pages/pages/metrics_page.dart';
import 'package:inatel_app_challenge/pages/pages/more_informations_page.dart';
import 'package:inatel_app_challenge/pages/pages/tests_page.dart';
import 'package:internet_speed_test/callbacks_enum.dart';
import 'package:internet_speed_test/internet_speed_test.dart';
import 'package:connectivity/connectivity.dart';

class HomeController extends GetxController {
  final GlobalKey<AnimatedCircularChartState> chartKey =
      new GlobalKey<AnimatedCircularChartState>();

  final internetSpeedTest = InternetSpeedTest();
  RxString transferRateDownload = '0.0 Kbps'.obs;
  RxString transferRateUpload = '0.0 Kbps'.obs;
  Rx<PingData> pingData = PingData().obs;
  RxDouble percent = 0.0.obs;
  RxList<CircularStackEntry> dataChart = <CircularStackEntry>[].obs;
  RxBool latencyTestIsRunning = false.obs;
  RxBool speedTestIsRunning = false.obs;
  bool uploadTestIsRunning = true;
  List<Widget> pages = [];
  RxInt indexPageSelect = 1.obs;
  RxBool hasConnection = false.obs;

  Rx<GeolocationData> geolocationData = GeolocationData(
    country: null,
    countryCode: null,
    timezone: null,
    ip: null,
    status: null,
    region: null,
    regionName: null,
    city: null,
    isp: null,
    org: null,
    zip: null,
    lat: null,
    lon: null,
  ).obs;

  HomeController() {
    connectivy();
    dataChart.add(
      CircularStackEntry(
        <CircularSegmentEntry>[
          new CircularSegmentEntry(0, ColorsApp.colorsList[1], rankKey: 'Q1'),
          new CircularSegmentEntry(100, ColorsApp.colorsList[3], rankKey: 'Q0'),
        ],
        rankKey: 'Quarterly Profits',
      ),
    );
    pages.addAll([
      MoreInformationPage(this),
      TestsPage(this),
      MetricsPage(),
    ]);
    getIp();
  }

  connectivy() async {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        hasConnection.value = false;
      } else {
        getIp();
        hasConnection.value = true;
      }
    });
  }

  Widget pageSelect() {
    return pages[indexPageSelect.value];
  }

  Future<void> getIp() async {
    geolocationData.value = await GeolocationAPI.getData();
  }

  startDownloadTesting() {
    internetSpeedTest.startDownloadTesting(
      onDone: (double transferRate, SpeedUnit unit) {
        this.percent.value = 100;
        this.transferRateDownload.value =
            '${transferRate.toString()} ${(unit == SpeedUnit.Kbps ? 'Kbps' : 'Mbps')}';
        updateDataChart();
        speedTestIsRunning.value = false;
      },
      onProgress: (double percent, double transferRate, SpeedUnit unit) {
        this.percent.value = percent;
        this.transferRateDownload.value =
            '${transferRate.toString()} ${(unit == SpeedUnit.Kbps ? 'Kbps' : 'Mbps')}';
        updateDataChart();
      },
      onError: (String errorMessage, String speedTestError) {
        print('Erro: $errorMessage');
      },
    );
  }

  updateDataChart() {
    this.chartKey.currentState.updateData([
      CircularStackEntry(
        <CircularSegmentEntry>[
          new CircularSegmentEntry(percent.value, ColorsApp.colorsList[1],
              rankKey: 'Q1'),
          new CircularSegmentEntry(100 - percent.value, ColorsApp.colorsList[3],
              rankKey: 'Q0'),
        ],
        rankKey: 'Quarterly Profits',
      ),
    ]);
  }

  startPingTest() async {
    final ping = Ping('google.com');
    latencyTestIsRunning.value = true;
    ping.stream.listen((event) => pingData.value = event);
    await Future.delayed(Duration(seconds: 5));
    ping.stop();
    latencyTestIsRunning.value = false;
  }

  startUploadTesting() {
    speedTestIsRunning.value = true;
    transferRateDownload.value = '0.0 Kbps';
    transferRateUpload.value = '0.0 Kbps';
    internetSpeedTest.startUploadTesting(
      onDone: (double transferRate, SpeedUnit unit) {
        this.transferRateUpload.value =
            '${transferRate.toString()} ${(unit == SpeedUnit.Kbps ? 'Kbps' : 'Mbps')}';
        this.percent.value = 100;
        updateDataChart();
        Future.delayed(Duration(seconds: 1));
        startDownloadTesting();
      },
      onProgress: (double percent, double transferRate, SpeedUnit unit) {
        this.transferRateUpload.value =
            '${transferRate.toString()} ${(unit == SpeedUnit.Kbps ? 'Kbps' : 'Mbps')}';
        this.percent.value = percent;
        updateDataChart();
      },
      onError: (String errorMessage, String speedTestError) {
        print('Erro: $errorMessage');
      },
    );
  }
}
