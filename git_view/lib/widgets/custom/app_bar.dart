import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Container(
      child: SizedBox(
          height: 50, width: 50, child: Lottie.asset("assets/logo.json")),
    ));
  }
}
