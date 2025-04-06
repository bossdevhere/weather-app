import 'package:flutter/material.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {

  final _weatherService= WeatherService('7be7dadf82da499f8fb070ff801b2ae0');
  Weather? _weather;

  _fetchWeather() async{
    String cityName = await _weatherService.getCurrentCity();

    try{
      final weather =await _weatherService.getCurrentCity();
      setState(() {
        _weather = weather;
      });
    }
    catch(e){
      print(e);
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:
      Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
            children: [
          Text(_weather?.cityName ?? "loading city..."),

          Text('${_weather?.temperature.round()}*C')
        ],),
      ),
    );
  }
}