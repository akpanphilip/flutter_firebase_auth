// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
// import 'package:flutter_firebase_auth/src/constants/colors.dart';
// import 'package:flutter_firebase_auth/src/constants/image_strings.dart';
// import 'package:flutter_firebase_auth/src/constants/sizes.dart';
// import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text('hi'),
      ),
    );
  }
}
