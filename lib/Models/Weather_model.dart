class Weather{
  final String cityName;
  final String temprature;
  final String maincondition;

  Weather({
    required this.cityName,
    required this.temprature,
    required this.maincondition,
});

  factory Weather.fromJson(Map<String, dynamic> Json){
    return Weather(cityName: Json['name'],
        temprature: Json['main']['temp'].toDouble(),
        maincondition: Json['weather'][0]['main']);
  }
}
