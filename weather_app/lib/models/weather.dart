import 'dart:convert';

class Weather {
  int id;
  String main;
  String description;

  Weather({required this.id, required this.main, required this.description});

  Map<String, dynamic> toMap() {
    return {'id': id, 'main': main, 'description': description};
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      id: (map['id'] ?? 0) as int,
      main: (map['main'] ?? "") as String,
      description: (map['description'] ?? "") as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Weather.fromJson(String source) =>
      Weather.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Main {
  num temp;
  num feelsLike;
  num tempMin;
  num tempMax;
  num humidity;

  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.humidity,
  });

  Map<String, dynamic> toMap() {
    return {
      'temp': temp,
      'feels_like': feelsLike,
      'temp_min': tempMin,
      'temp_max': tempMax,
      'humidity': humidity,
    };
  }

  factory Main.fromMap(Map<String, dynamic> map) {
    return Main(
      temp: (map['temp'] ?? 0.0) as num,
      feelsLike: (map['feels_like'] ?? 0.0) as num,
      tempMin: (map['temp_min'] ?? 0.0) as num,
      tempMax: (map['temp_max'] ?? 0.0) as num,
      humidity: (map['humidity'] ?? 0) as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory Main.fromJson(String source) =>
      Main.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Wind {
  num speed;
  num deg;

  Wind({required this.speed, required this.deg});

  Map<String, dynamic> toMap() {
    return {'speed': speed, 'deg': deg};
  }

  factory Wind.fromMap(Map<String, dynamic> map) {
    return Wind(
      speed: (map['speed'] ?? 0.0) as num,
      deg: (map['deg'] ?? 0) as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory Wind.fromJson(String source) =>
      Wind.fromMap(json.decode(source) as Map<String, dynamic>);
}

class WeatherData {
  int id;
  List<Weather> weather;
  String base;
  Main main;
  int visibility;
  Wind wind;
  String name;
  int cod;

  WeatherData({
    required this.id,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.name,
    required this.cod,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'weather': weather.map((x) => x.toMap()).toList(),
      'base': base,
      'main': main.toMap(),
      'visibility': visibility,
      'wind': wind.toMap(),
      'name': name,
      'cod': cod,
    };
  }

  factory WeatherData.fromMap(Map<String, dynamic> map) {
    return WeatherData(
      id: (map['id'] ?? 0) as int,
      weather: List<Weather>.from(
        (map['weather'] ?? []).map<Weather>(
          (x) => Weather.fromMap(x as Map<String, dynamic>),
        ),
      ),
      base: (map['base'] ?? "") as String,
      main: Main.fromMap(map['main'] ?? {}),
      visibility: (map['visibility'] ?? 0) as int,
      wind: Wind.fromMap(map['wind'] ?? {}),
      name: (map['name'] ?? "") as String,
      cod: (map['cod'] ?? 0) as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherData.fromJson(String source) =>
      WeatherData.fromMap(json.decode(source) as Map<String, dynamic>);
}

class WeatherDetail {
  Main main;
  Weather weather;
  String dtT;

  WeatherDetail({required this.main, required this.weather, required this.dtT});

  Map<String, dynamic> toMap() {
    return {'main': main.toMap(), 'weather': weather.toMap(), 'dt_t': dtT};
  }

 factory WeatherDetail.fromMap(Map<String, dynamic> map) {
  return WeatherDetail(
    main: Main.fromMap(map['main']),
    weather: Weather.fromMap(map['weather'][0] as Map<String, dynamic>),
    dtT: (map['dt_txt'] != null) ? map['dt_txt'].toString() : "Unknown", // Fix lỗi Null
  );
}

  String toJson() => json.encode(toMap());

  factory WeatherDetail.fromJson(String source) =>
      WeatherDetail.fromMap(json.decode(source));
}
