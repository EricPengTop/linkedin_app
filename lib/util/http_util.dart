import 'package:http/http.dart' as http;
import 'dart:async';

Future<http.Response> fetchGet(url) {
  return http.get(url);
}