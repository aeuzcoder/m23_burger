import 'package:flutter/material.dart';
import 'package:m23_burger/feature/presentation/pages/first_page/first_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const FirstPage(),
      theme: ThemeData(fontFamily: 'SF-Pro'),
    );
  }
}
