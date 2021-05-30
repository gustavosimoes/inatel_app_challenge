import 'package:meta/meta.dart' show required;

class GeolocationData {
  final String country,
      countryCode,
      timezone,
      ip,
      status,
      region,
      regionName,
      city,
      zip,
      isp,
      org;
  final double lat, lon;

  GeolocationData(
      {@required this.country,
      @required this.countryCode,
      @required this.timezone,
      @required this.ip,
      @required this.status,
      @required this.region,
      @required this.regionName,
      @required this.city,
      @required this.zip,
      @required this.isp,
      @required this.org,
      @required this.lat,
      @required this.lon});

  factory GeolocationData.fromJson(Map<String, dynamic> json) {
    return GeolocationData(
        country: json['country'],
        countryCode: json['countryCode'],
        timezone: json['timezone'],
        ip: json['query'],
        status: json['status'],
        region: json['region'],
        regionName: json['regionName'],
        city: json['city'],
        isp: json['isp'],
        org: json['org'],
        zip: json['zip'],
        lat: json['lat'],
        lon: json['lon']);
  }

  Map<String, dynamic> toJson() {
    return {
      "country": this.country,
      "countryCode": this.countryCode,
      "timezone": this.timezone,
      "ip": this.ip,
      "status": this.status,
      "region": this.region,
      "regionName": this.regionName,
      "city": this.city,
      "isp": this.isp,
      "org": this.org,
      "zip": this.zip,
      "lat": this.lat,
      "lon": this.lon
    };
  }
}
