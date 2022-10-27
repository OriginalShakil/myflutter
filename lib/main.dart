import 'package:flutter/material.dart';
import 'package:myflutter/screens/notesview.dart';
import 'package:myflutter/screens/test.dart';
import 'package:myflutter/screens/verifyemail.dart';
import 'package:myflutter/utills/constant.dart';
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
      home: const HomePage(),
      routes: {
        loginRoute:(context) => const LoginView(),
        regRoute:(context) => const Registration(),
        noteRoute:(context) => const NotesView(),
        verifyMailRoute:(context) => const VerifyEmailView(),
        testRoute:(context) => const TestWed(),
      },
    );
  }
}
