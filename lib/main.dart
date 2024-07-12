import 'package:flutter/material.dart';
import 'package:love_4_movies/screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Love 4 Movies',
      home: HomeScreen(),
    );
  }
}
