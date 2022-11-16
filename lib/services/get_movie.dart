import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movie_app/model/movie_model.dart';

class GetMoveiService {
  final url = "https://api.tvmaze.com/shows";
  Future<List<Movie>> getMovie() async {
    try {
      final response = await Dio().get(url);
      if (response.statusCode == 200) {
        log('Successsf');
        // log(response.data.toString());
        return movieFromJson(jsonEncode(response.data));
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
