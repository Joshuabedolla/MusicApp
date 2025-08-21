import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:musicapp/screens/profile_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializar soporte para fechas en español
  await initializeDateFormatting('es_ES', null);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}
