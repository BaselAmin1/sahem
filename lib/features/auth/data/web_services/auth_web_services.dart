 import 'package:dio/dio.dart';
import 'package:sahem_app/helper/constants/strings.dart';


 class AuthWebServices {
  static late Dio dio;

   static init() {
     BaseOptions options = BaseOptions(
       baseUrl: kBaseUrl,
      receiveDataWhenStatusError: true,
      validateStatus: (status) => true,
       receiveTimeout: 200 * 1000,
       connectTimeout: 200 * 1000,
     );
     dio = Dio(
       options,
     );
   }

   static Future<Response> postAuthData({
     required String endPoint,
    required Map<String, dynamic> data,
     Map<String, dynamic>? query,
   }) async {
     dio.options.headers = {
       'Content-Type': 'application/json',
     };

     return dio.post(
      endPoint,
       data: data,
     queryParameters: query,
     );
   }
 }
