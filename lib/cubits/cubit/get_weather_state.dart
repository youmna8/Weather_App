part of 'get_weather_cubit.dart';

@immutable
sealed class GetWeatherState {}

final class GetWeatherInitial extends GetWeatherState {}

final class NoWeatherState extends GetWeatherState {}

final class WeatherErrorState extends GetWeatherState {
  final String errorMessage;

  WeatherErrorState( this.errorMessage);
}

final class WeatherLoadedState extends GetWeatherState {
 final WeatherModel weatherModel;

  WeatherLoadedState(this.weatherModel);
}
