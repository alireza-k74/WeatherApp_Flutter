import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp_flutter/blocs/theme/theme_state.dart';
import 'blocs/weather/weather_bloc.dart';
import 'blocs/theme/theme_bloc.dart';
import 'repositories/weather_repository.dart';
import 'services/weather_api_service.dart';
import 'ui/screens/weather_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeBloc()),
        BlocProvider(
          create: (context) => WeatherBloc(
            WeatherRepository(apiService: WeatherApiService()),
          ),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            theme: state.themeData,
            home: WeatherScreen(),
          );
        },
      ),
    );
  }
}
