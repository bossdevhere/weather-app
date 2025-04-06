import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
ls
class WeatherService{
  static const BASE_URL ='http://api.openweathermap.org/data/2.5/weather';
  final String apiKey;
  WeatherService(this.apiKey);
  Future<Weather> getWeather(String cityName) async {
    final response = await http.get(Uri.parse('$BASE_URL?cityName&appid=$apiKey&units=metric'));
    if (response.statusCode == 200){
      return Weather.fromJson(jsonDecode(response.body));
    }
    else{
      throw Exception('Failed to load weather data');
    }
  }
  Future<String> getCurrentCity() async{
    LocationPermission permission=await Geolocator.checkPermission();
    permission=await Geolocator.requestPermission();

    Position position=await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    List<Placemark> placemarks= await placemarkFromCoordinates(position.latitude, position.longitude);

    String? city = placemarks[0].locality;
    return city ?? "";
  }
}