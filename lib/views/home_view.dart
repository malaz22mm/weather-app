import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/providers/weather_provider.dart';
import '../widgets/no_weather_body.dart';
import '../widgets/search_page.dart';
import '../widgets/weather_info_body.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return SearchPage();
            }));
          }, icon: const Icon(Icons.search))
        ],
        title: const Text('Weather App'),
      ),
      body:Provider.of<weatherProvider>(context).weather==null? NoWeatherBody(): WeatherInfoBody(),
    );
  }
}
