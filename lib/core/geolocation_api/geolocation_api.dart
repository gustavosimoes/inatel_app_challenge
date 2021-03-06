import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:inatel_app_challenge/core/geolocation_api/geolocation_data.dart';

class GeolocationAPI {
  static Future<GeolocationData> getData({String query = ''}) async {
    try {
      final response = await http.get("http://ip-api.com/json/$query");
      if (response.statusCode == 200) {
        print(response.body);
        final parsed = jsonDecode(response.body);
        return GeolocationData.fromJson(parsed);
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
