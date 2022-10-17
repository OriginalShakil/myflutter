import 'package:flutter/material.dart';
import 'screens/homePage.dart';
import 'screens/login.dart';
import 'screens/registration.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        '/login':(context) => const LoginView(),
        '/register':(context) => const Registration(),
      },
    );
  }
}
