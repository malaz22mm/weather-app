import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/providers/weather_provider.dart';
import 'package:weather/views/home_view.dart';

void main() {
  runApp( ChangeNotifierProvider(create: (context){
    return weatherProvider();

  },child: const WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme:ThemeData(
          primarySwatch: Provider.of<weatherProvider>(context).weather==null ? Colors.blue
              :Provider.of<weatherProvider>(context).weather!.getTheme()
      ) ,
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
