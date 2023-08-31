// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/src/constants/image_strings.dart';
import 'package:flutter_firebase_auth/src/features/authentication/controllers/splash_screen_controller.dart';
import 'package:flutter_firebase_auth/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final splashController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    splashController.startAnimation();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Obx(
              () => AnimatedPositioned(
                  duration: const Duration(milliseconds: 1600),
                  top: splashController.animate.value ? 60 : -160,
                  left: splashController.animate.value ? 60 : -160,
                  child: Container(
                    width: splashController.animate.value ? 60 : 10,
                    height: splashController.animate.value ? 60 : 10,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(50)),
                  )),
            ),
            Obx(
              () => AnimatedPositioned(
                  duration: const Duration(milliseconds: 1600),
                  bottom: 200,
                  right: -100,
                  child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 1600),
                      opacity: splashController.animate.value ? 1 : 0,
                      child: Image(image: AssetImage(logoImage)))),
            ),
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
}
