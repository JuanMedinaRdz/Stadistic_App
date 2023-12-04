import 'package:flutter/material.dart';
import 'package:stadistic_app/pages/home.dart';

void main() => runApp( MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home': ( _ ) => HomePage()
      },

    );
  }
}