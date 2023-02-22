import 'dart:convert';

import 'package:authorization/model/auth_model_code.dart';
import 'package:authorization/model/auth_model_phone.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthRepo {
  final Dio dio;
  AuthRepo({required this.dio});

  final storage = const FlutterSecureStorage();

  String basicAuth = 'Basic ${base64.encode(
    utf8.encode('testEmil12:11223344'),
  )}';

  Future<Modelphone> sendPhone({required String phoneNumber}) async {
    final response = await dio.get(
      '/generateUserId/test?',
      queryParameters: {'msisdn': phoneNumber},
      options: Options(headers: {'authorization': basicAuth}),
    );
    final result = Modelphone.fromJson(response.data);
    await storage.write(key: 'token', value: result.object);
    return result;
  }

  Future<Modelcode> sendCode({required String code}) async {
    final response = await dio.get(
      '/checkCode/test?',
      queryParameters: {
        'code': code,
        'uuId': '${await storage.read(key: 'token')}'
      },
      options: Options(headers: {'authorization': basicAuth}),
    );
    return Modelcode.fromJson(response.data);
  }
}
