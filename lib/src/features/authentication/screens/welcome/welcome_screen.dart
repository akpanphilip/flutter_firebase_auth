// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/src/constants/colors.dart';
import 'package:flutter_firebase_auth/src/constants/image_strings.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image(image: AssetImage(logoImage)),
            SizedBox(height: 40),
            Column(
              children: [
                Text(
                  'Big Brands Direct To You',
                  style: GoogleFonts.poppins(
                      color: tDarkColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 10),
                Text(
                    'Discover the latest shoe trends & footwear styles at Clarks. Explore our range of fashionable shoes, trendy sandals, casual trainers & iconic boots',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: tDarkColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500)),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                    child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(),
                          foregroundColor: tSecondaryColor,
                          side: BorderSide(color: tSecondaryColor),
                          padding: EdgeInsets.symmetric(vertical: 15),
                        ),
                        child: Text('Login'))),
                SizedBox(width: 10),
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(),
                          foregroundColor: tWhiteColor,
                          backgroundColor: tSecondaryColor,
                          side: BorderSide(color: tSecondaryColor),
                          padding: EdgeInsets.symmetric(vertical: 15),
                        ),
                        child: Text('Register'))),
              ],
            ),
            SizedBox(height: 70),
          ],
        ),
      ),
    ));
  }
}
