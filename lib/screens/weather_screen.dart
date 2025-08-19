import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../widgets/background_scaffold.dart'; // 👈 importar BackgroundScaffold

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final String city = 'Puebla';
  final String lang = 'es';
  final String apiKey = '8a3ec5e3b0994baaae9180153251608';
  final String baseUrl = 'http://api.weatherapi.com/v1/current.json?';

  Future<WeatherResponse> getWeather() async {
    final url = Uri.parse('$baseUrl&key=$apiKey&q=$city&lang=$lang');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return WeatherResponse(
          status: true,
          body: Weather(
            city: data["location"]["name"],
            temp: data["current"]["temp_c"].toString(),
            condition: data["current"]["condition"]["text"],
            icon: data["current"]["condition"]["icon"],
          ),
        );
      } else {
        throw Exception('Error al obtener el clima');
      }
    } catch (e) {
      return WeatherResponse(status: false, body: null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      appBar: AppBar(
        title: const Text('Clima'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple.withOpacity(0.85),
        elevation: 4,
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
      ),
      body: FutureBuilder<WeatherResponse>(
        future: getWeather(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError ||
              !snapshot.hasData ||
              !snapshot.data!.status) {
            return const Center(child: Text('Error al obtener el clima'));
          } else {
            Weather weather = snapshot.data!.body!;
            return WeatherCard(weather: weather);
          }
        },
      ),
    );
  }
}

class WeatherCard extends StatelessWidget {
  final Weather weather;

  const WeatherCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 500,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.purple, Colors.deepPurple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.symmetric(vertical: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: DefaultTextStyle(
          style: const TextStyle(color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'El clima en ${weather.city}',
                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
              ),
              Text('${weather.temp}°', style: const TextStyle(fontSize: 90)),
              const SizedBox(height: 10),
              Image.network(
                'https:${weather.icon}',
                width: 64,
                height: 64,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 10),
              Text(
                weather.condition,
                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w200),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Weather {
  final String city;
  final String temp;
  final String condition;
  final String icon;

  Weather({
    required this.temp,
    required this.condition,
    required this.icon,
    required this.city,
  });
}

class WeatherResponse {
  final bool status;
  final Weather? body;
  WeatherResponse({required this.status, required this.body});
}
