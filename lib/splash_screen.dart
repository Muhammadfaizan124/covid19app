import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:covid19app/home_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 9), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedTextKit(animatedTexts: [
                ColorizeAnimatedText(
                  "COVID-19\nDEVASTATION",
                  textAlign: TextAlign.center,
                  textStyle: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                  colors: [
                    Colors.red,
                    Colors.orange,
                    Colors.red.shade300,
                    Colors.orange.shade300,
                    Colors.red
                  ],
                  speed: Duration(seconds: 1),
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
