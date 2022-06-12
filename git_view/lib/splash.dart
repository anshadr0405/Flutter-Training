import 'dart:async';
import 'package:git_view/widgets/home/home.dart';
import 'package:git_view/widgets/login/login.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashScreen extends StatefulWidget {
  @override
  Splash createState() => Splash();
}

class Splash extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => Login())));

    return Container(
        color: Colors.white,
        child:
            Center(child: SizedBox(child: Lottie.asset("assets/logo.json"))));
  }
}
