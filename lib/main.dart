import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://dcfjpxpzfbgzyylrrgou.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRjZmpweHB6ZmJnenl5bHJyZ291Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzE3ODA0ODcsImV4cCI6MjA4NzM1NjQ4N30.PcZhCEjJ4gRVDaRfzxpM5WwhiT1_BdIlHZDakrKzeI0',
  );

  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mueen',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      // If a session already exists, go to Home. Otherwise, go to Login.
      home: supabase.auth.currentSession == null
          ? const LoginScreen()
          : const HomeScreen(),
    );
  }
}