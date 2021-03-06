import 'package:apicomgetx/https/url.dart';
import 'package:http/http.dart' as http;

class Requests {
  final String url;
  final dynamic body;

  Requests({this.url, this.body});

  Future<http.Response> post() {
    return http.post(urlBase + url, body: body).timeout(Duration(minutes: 2));
  }

  Future<http.Response> get() {
    return http.get(urlBase + url).timeout(Duration(minutes: 2));
  }
}
