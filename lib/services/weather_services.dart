

import 'dart:developer';

import 'package:weather_app/models/weather_model.dart';
import 'package:dio/dio.dart';

class WeatherServices {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '5b4f1aaca0a54ed4987101706230112%20';

  WeatherServices(this.dio);

  Future<WeatherModel> getWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=10');

      WeatherModel weathermodel = WeatherModel.fromJson(response.data);
      return weathermodel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['erroe']['message'] ??
          'oops there was an error , try later';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('try later');
    }
  }
}
