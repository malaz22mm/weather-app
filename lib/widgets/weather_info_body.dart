import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/providers/weather_provider.dart';

class WeatherInfoBody extends StatelessWidget {
weatherModel? weatherData;

  WeatherInfoBody({super.key});
  @override
  Widget build(BuildContext context) {
    weatherData=Provider.of<weatherProvider>(context).weather;
    return Container(
      decoration:  BoxDecoration(
        gradient: LinearGradient(colors: [
          weatherData!.getTheme(),
          weatherData!.getTheme()[300]!,
          weatherData!.getTheme()[100]!
        ]
        ,
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
               Provider.of<weatherProvider>(context).cityName!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
             Text(
              'updated at :${weatherData!.date.toString()}',
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Image.asset(weatherData!.getImage()),

                 Text(
                   '${weatherData!.temp.toInt()}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                 Column(
                  children: [
                    Text(
                      'Maxtemp: ${weatherData!.maxTemp.toInt()}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Mintemp: ${weatherData!.minTemp.toInt()}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
             Text(
              weatherData!.weatherState,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
