
import 'dart:async';

import 'package:flutter/material.dart';

class splashscreen extends StatelessWidget {
  const splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, 'home');
    });
    return Scaffold(
      backgroundColor: Color(0xff00796B),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        //decoration: BoxDecoration(color: Colors.black),
        child: Image.asset(
          "assets/img/logo.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
