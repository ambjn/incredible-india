import 'package:flutter/material.dart';
import 'package:incredible_india/screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Incredible India',
      theme: ThemeData(primaryColor: Colors.white, fontFamily: 'Raleway'),
      home: HomeScreen(),
    );
  }
}
