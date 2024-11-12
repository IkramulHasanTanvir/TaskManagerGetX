import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:task_manager_get_x/data/models/network_response.dart';

class NetworkCaller {
  Future<NetworkResponse> getRequest({required String url}) async {
    try {
      Uri uri = Uri.parse(url);
      debugPrint(url);

      final Response response = await get(uri);

      final decodeData = jsonDecode(response.body);

      if (response.statusCode == 200 && decodeData['status'] == 'success') {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseBody: decodeData,
        );
      } else if (response.statusCode == 401 ||
          response.statusCode == 404 && decodeData['status'] == 'fail') {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMassage: decodeData['data'],
        );
      } else {
        return NetworkResponse(
            statusCode: response.statusCode,
            isSuccess: false,
            errorMassage: 'please try again');
      }
    } catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMassage: e.toString(),
      );
    }
  }
}
