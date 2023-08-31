// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously, must_call_super, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/src/constants/image_strings.dart';
import 'package:flutter_firebase_auth/src/features/authentication/controllers/splash_screen_controller.dart';
import 'package:flutter_firebase_auth/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animate = false;

  // final splashController = Get.put(SplashScreenController());

  @override
  void initState() {
    startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedPositioned(
                duration: const Duration(milliseconds: 1600),
                top: animate ? 60 : -160,
                left: animate ? 60 : -160,
                child: Container(
                  width: animate ? 60 : 10,
                  height: animate ? 60 : 10,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(50)),
                )),
            AnimatedPositioned(
                duration: const Duration(milliseconds: 1600),
                bottom: animate ? 200 : -150,
                right: animate ? 100 : -150,
                child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 1600),
                    opacity: animate ? 1 : 0,
                    child: Image(image: AssetImage(logoImage)))),
            Positioned(
                bottom: 300,
                right: -180,
                child: Container(
                  width: 200,
                  height: 10,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                ))
          ],
        ),
      ),
    );
  }

  Future startAnimation() async {
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {
      animate = true;
    });
    await Future.delayed(Duration(milliseconds: 15000));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
  }
}
