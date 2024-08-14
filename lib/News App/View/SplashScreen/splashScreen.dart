import 'dart:async';
import 'package:flutter/material.dart';

import '../HomePage/homePage.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) =>  const HomePage()));
    });
    double width = MediaQuery.of(context).size.width ;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff343434),
              Color(0xff181818),
            ],
          ),
        ),
        child: Center(
          child: Image.asset(
            'assets/news.png',
            height: width * 0.7,
          ),
        ),
      ),
    );
  }
}