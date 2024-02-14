import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/cubit/get_weather_cubit.dart';
import 'package:weather_app/views/search.dart';
import 'package:weather_app/widget/noweather.dart';
import 'package:weather_app/widget/weather_info.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return Search();
                  }));
                },
                icon: Icon(Icons.search))
          ],
        ),
        body: BlocBuilder<GetWeatherCubit, GetWeatherState>(
            builder: (context, state) {
          if (state is GetWeatherInitial) {
            return NoWeatherBody();
          } else if (state is WeatherLoadedState) {
            return WeatherInfoBody(weatherModel: state.weatherModel,);
          } else {
            return Text('There was an error');
          }
        }));
  }
}
