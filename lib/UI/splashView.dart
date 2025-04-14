import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_islami/UI/intro_screen.dart';

class SplashView extends StatefulWidget {
  static const String routeName = "/splash";

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, IntroScreen.routName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff202020),
      body: Column(
        children: [
          Spacer(),
          Center(
            child: Image.asset(
              "assets/images/Group_28.png",
              width: 200,
              height: 200,
            ),
          ),
          Spacer(),
          Column(
            children: [
              Image.asset(
                "assets/images/1ebf2d114a74732b9b16454d85cd025b.png",
                width: 120,
              ),
              SizedBox(height: 8),
              Text(
                "Supervised by Mohamed Nabil",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}
