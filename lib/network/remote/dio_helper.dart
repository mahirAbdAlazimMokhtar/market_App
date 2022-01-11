import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioHelper {
  //when you finish create dio
  //go to the main add
  // DioHelper.init();
  //WidgetsFlutterBinding.ensureInitialized();
  static Dio? dio;

//this for init
  static init() {
    // ignore: avoid_print
    print('dio Initialize');
    dio = Dio(BaseOptions(
      //z dio need to things first thing z base url
      // and the status when the data come {done , have error}
      baseUrl: 'https://student.valuxapps.com/api/',
      receiveDataWhenStatusError: true,
      headers: {
        'Content-Type': 'application/json',
      },
    ));
    if (kDebugMode) {
      print('Dio is created');
    }
  }

  //this method 4 get data from the api and his type is future why b may be wait data
  static Future<Response> getData({
    required String url,
    required dynamic query,
    String lang = 'ar',
    String? token,
  }) async {
    dio!.options.headers = {
      'lang': lang,
      'authorization': token,
    };
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }

//this method 4 post data from the api and his type is future why b may be wait data
  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'ar',
    String? token,
  }) async {
    //this for header
    dio!.options.headers = {
      'lang': lang,
      'authorization': token,
    };
    return dio!.post(
      url,
      data: data,
      queryParameters: query,
    );
  }
}
