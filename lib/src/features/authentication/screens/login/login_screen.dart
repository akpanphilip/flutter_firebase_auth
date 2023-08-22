// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/src/constants/colors.dart';
import 'package:flutter_firebase_auth/src/constants/image_strings.dart';
import 'package:flutter_firebase_auth/src/constants/sizes.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(image: AssetImage(logoImage)),
                Text(
                  'Welcome Back',
                  style: GoogleFonts.poppins(
                      color: tDarkColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 10),
                Form(
                    child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person_outline_outlined),
                              labelText: 'Email',
                              hintText: 'Email',
                              border: OutlineInputBorder()),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.fingerprint_rounded),
                              suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.remove_red_eye_rounded)),
                              labelText: 'Password',
                              hintText: 'Password',
                              border: OutlineInputBorder()),
                        ),
                        SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forget Password?',
                              style: GoogleFonts.poppins(color: tDarkColor),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(),
                                foregroundColor: tWhiteColor,
                                backgroundColor: tSecondaryColor,
                                side: BorderSide(color: tSecondaryColor),
                                padding: EdgeInsets.symmetric(vertical: 20),
                              ),
                              onPressed: () {},
                              child: Text('Login')),
                        ),
                        SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('OR'),
                            SizedBox(
                              width: double.infinity,
                              child: OutlinedButton.icon(
                                  onPressed: () {},
                                  icon: Image(
                                      image: AssetImage(google),
                                      width: 30,
                                      height: 30),
                                  label: Text('Sign in with Google')),
                            )
                          ],
                        )
                      ]),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}