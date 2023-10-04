import 'package:dio/dio.dart';

final dio = Dio();

Future<Response> handleHTTP(String url) async {
  Response<dynamic> response = await dio.get(url);
  return response;
}
