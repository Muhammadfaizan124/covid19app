import 'package:covid19app/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const covid19app());
}

class covid19app extends StatelessWidget {
  const covid19app({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
