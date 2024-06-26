import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../models/user/user_model.dart';
import 'api_urls.dart';

class APIServices {
  late final Dio _dio;
  APIServices(this._dio);

  Options dioOptions({
    required String token,
    contentType
  }) {
    return Options(headers: <String, dynamic>{
      'Authorization': 'Bearer $token',
      'Content-Type':contentType
    });
  }

  Future<UserModel> getUsersAPI() async{
    Response response = await _dio.get(
      APIUrls.getUserDetailsUrl,
    ).catchError((onError){
      if (kDebugMode) {
        print('Catch Error:=> $onError');
      }
      throw onError;
    });
    return UserModel.fromJson(response.data);
  }
}