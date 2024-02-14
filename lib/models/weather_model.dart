class WeatherModel {
  final String cityName;
  final String date;
  final String? image;
  final double temp;
  final double maxTimp;
  final double minTemp;
  final String weatherCondition;

  WeatherModel(
      {required this.cityName,
      required this.date,
      this.image,
      required this.temp,
      required this.maxTimp,
      required this.minTemp,
      required this.weatherCondition});

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
        cityName: json['location']['name'],
        date: json['current']['last_updated'],
        temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        maxTimp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        weatherCondition: json['forecast']['forecastday'][0]['day']['condition']['text']);
  }
}
