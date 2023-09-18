import 'dart:async';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'home_screen.dart';

class SplashScrenn extends StatefulWidget {
  const SplashScrenn({super.key});

  @override
  State<SplashScrenn> createState() => _SplashScrennState();
}

class _SplashScrennState extends State<SplashScrenn> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.push(
          context,
          PageTransition(
              child: const HomeScreen(), type: PageTransitionType.fade));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: size.width * 0.35,
            width: size.width * 0.35,
            child: Image.asset(
              'assets/images/icon.png',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const Center(
            child: Text(
              'Quote of the Day',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
          )
        ],
      )),
    );
  }
}
