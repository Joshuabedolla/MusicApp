import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../widgets/background_scaffold.dart'; // 👈 Fondo global

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
        title: const Text("Clima"),
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
            return const Center(
              child: CircularProgressIndicator(color: Colors.deepPurple),
            );
          } else if (snapshot.hasError ||
              !snapshot.hasData ||
              !snapshot.data!.status) {
            return const Center(
              child: Text(
                '❌ Error al obtener el clima',
                style: TextStyle(fontSize: 18, color: Colors.redAccent),
              ),
            );
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
        width: 330,
        height: 500,
        margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          gradient: const LinearGradient(
            colors: [Color(0xFF8E2DE2), Color(0xFF4A00E0)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Ciudad
            Text(
              weather.city,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 12),

            // Temperatura
            Text(
              "${weather.temp}°C",
              style: const TextStyle(
                fontSize: 90,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),

            // Icono del clima
            Image.network(
              "https:${weather.icon}",
              width: 90,
              height: 90,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 14),

            // Condición
            Text(
              weather.condition,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w400,
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),

            const Spacer(),

            // Footer con branding
            const Text(
              "WeatherAPI • Actualizado en tiempo real",
              style: TextStyle(
                fontSize: 14,
                color: Colors.white54,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// 📌 Modelos
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
