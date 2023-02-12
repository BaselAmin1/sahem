import 'package:dio/dio.dart';
import 'package:sahem_app/helper/constants/strings.dart';

class ProfileWebServices {
  static late Dio dio;

  static init() {
    BaseOptions options = BaseOptions(
      baseUrl: kBaseUrl,
      receiveDataWhenStatusError: true,
      receiveTimeout: 20 * 1000,
      connectTimeout: 20 * 1000,
    );
    dio = Dio(options);
  }

  static Future<Response> getUserByToken({
    required String url,
  }) async {
    dio.options.headers = {
      'x-auth-token': kToken,
    };
    return dio.get(
      url,
    );
  }

  static Future<Response> putUserById({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
    };
    return dio.put(
      url,
      data: data,
      queryParameters: query,
    );
  }

  static Future<Response> postReport({
    required String url,
    required FormData data,
  }) async {
    dio.options.headers = {
      'x-auth-token':kToken,
    };
    return dio.post(
      url,
      data: data,
    );
  }
}
