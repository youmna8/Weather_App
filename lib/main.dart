import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/cubit/get_weather_cubit.dart';
import 'package:weather_app/views/home.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCubit, GetWeatherState>(
          builder: (context, state) {
            return MaterialApp(
                theme: ThemeData(
                    primarySwatch: getWeatherColor(
                        BlocProvider.of<GetWeatherCubit>(context)
                            .weatherModel
                            ?.weatherCondition)),
                debugShowCheckedModeBanner: false,
                home: Scaffold(
                  body: HomeView(),
                ));
          },
        );
      }),
    );
  }
}

MaterialColor getWeatherColor(String? weatherCondition) {
  if (weatherCondition == null) {
    return Colors.blue;
  }
  switch (weatherCondition) {
    case "Sunny":
      return Colors.orange;
    case "partly Cloudy":
      return Colors.grey;
    case "Patchy rain nearby":
      return Colors.grey;
    case "Overcast":
      return Colors.grey;
    case "Mist":
      return Colors.amber;
    case "patchy rain possible":
    case "patchy snow possible":
    case "patchy sleet possible":
    case "patchy freezing drizzle possible":
      return Colors.blue;
    case "thundery outbreaks possible":
      return Colors.indigo;
    case "Blowing Snow":
    case "blizzard":
      return Colors.blueGrey;
    case "Fog":
    case "freezing fog":
      return Colors.blueGrey;
    case "patchy light drizzle":
    case "light drizzle":
    case "freezing drizzle":
    case "heavy freezing drizzle":
      return Colors.blue;
    case "Patchy light rain":
    case "light rain":
    case "moderate rain at times":
    case "moderate rain":
    case "heavy rain at times":
    case "Heavy rain":
      return Colors.blueGrey;
    case "light freezing rain":
    case "moderate or heavy freezing rain":
    case "light sleet":
      return Colors.blue;
    case "moderate or heavy sleet":
    case "patchy light snow":
    case "light snow":
    case "patchy moderate snow":
    case "moderate snow":
    case "patchy heavy snow":
    case "heavy snow":
      return Colors.amber;
    case "Ice Pellets":
      return Colors.blueGrey;
    case "Light rain shower":
    case "moderate or heavy rain shower":
    case "torrential rain shower":
      return Colors.blue;
    case "light sleet showers":
    case "moderate or heavy sleet showers":
    case "light snow showers":
    case "moderate or heavy snow showers":
      return Colors.amber;
    case "light showers of ice pellets":
    case "moderate or heavy showers of ice pellets":
      return Colors.amber;
    case "patchy light rain with thunder":
    case "moderate or heavy rain with thunder":
      return Colors.purple;
    case "Patchy light snow with thunder":
    case "moderate or heavy snow with thunder":
      return Colors.deepPurple;
    default:
      return Colors.amber;
  }
}







//create state
//create cubit
//create function
//provide cubit
//integrte cubit
//trigger cubit
