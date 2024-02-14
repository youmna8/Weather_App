import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';

part 'get_weather_state.dart';

class GetWeatherCubit extends Cubit<GetWeatherState> {
  GetWeatherCubit() : super(GetWeatherInitial());

   WeatherModel? weatherModel;

  getWeather({required String cityName}) async {
    try {
       weatherModel =
          await WeatherServices(Dio()).getWeather(cityName: cityName);
    } catch (e) {
      emit(WeatherErrorState(e.toString()));
    }
    emit(WeatherLoadedState(weatherModel!));
  }
}
