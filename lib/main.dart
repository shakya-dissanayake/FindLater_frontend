import 'package:flutter/material.dart';
import 'package:frontend/pages/components/bottom_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Find Later',
      theme: ThemeData(
        fontFamily: 'ProximaNova',
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const BottomNavBar(),
    );
  }
}