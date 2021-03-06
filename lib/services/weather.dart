import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';

const apikey = 'abb333ae6cc83390c91e77c6fde2f777';
const weatherurl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getcityweather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
      Uri.parse('$weatherurl?q=$cityName&appid=$apikey&units=metric'),
    );

    var weatherdata = await networkHelper.getData();
    return weatherdata;
  }

  Future<dynamic> getlocationweather() async {
    Location location = Location();
    await location.getcurrentlocation();

    NetworkHelper networkHelper = NetworkHelper(Uri.parse(
        '$weatherurl?lat=${location.latitude1}&lon=${location.longitude1}&appid=$apikey&units=metric'));

    var weatherdata = await networkHelper.getData();
    return weatherdata;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
