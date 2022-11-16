import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import '../model/cast_model.dart';

class GetCastService {
 
  Future<List<MovieCast>> getCast(int id) async {
     final url = "https://api.tvmaze.com/shows/$id/cast";
    try {
      final response = await Dio().get(url);
      if (response.statusCode == 200) {
        log('Successsf');
        return movieCastFromJson(jsonEncode(response.data));
      } else {
        throw 'something went worong';
      }
    } catch (e) {
      if (e is DioError) {
        if (e.response != null) {
          if (e.response?.data == null) {
            throw 'something went wrong';
          }
        }
        throw 'No internet';
      } else {
        throw 'something went wrong';
      }
    }
  }
}
