// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/src/constants/colors.dart';
import 'package:flutter_firebase_auth/src/constants/image_strings.dart';
import 'package:flutter_firebase_auth/src/constants/sizes.dart';
import 'package:flutter_firebase_auth/src/features/authentication/screens/login/login_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(image: AssetImage(logoImage)),
                Text(
                  'Get on Board!',
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
                              labelText: 'Full Name',
                              hintText: 'Full Name',
                              border: OutlineInputBorder()),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.mail_outline),
                              labelText: 'E-Mail',
                              hintText: 'E-Mail',
                              border: OutlineInputBorder()),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.phone),
                              labelText: 'Phone No',
                              hintText: 'Phone No',
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
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                foregroundColor: tWhiteColor,
                                backgroundColor: tSecondaryColor,
                                side: BorderSide(color: tSecondaryColor),
                                padding: EdgeInsets.symmetric(vertical: 20),
                              ),
                              onPressed: () {},
                              child: Text('SIGNUP')),
                        ),
                        SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('OR'),
                            SizedBox(height: 20),
                            Container(
                                height: 60,
                                width: double.infinity,
                                child: OutlinedButton.icon(
                                  style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  onPressed: () {},
                                  icon: Image(
                                      image: AssetImage(google),
                                      width: 30,
                                      height: 30),
                                  label:
                                      Text('Sign in with Google'.toUpperCase()),
                                ))
                          ],
                        ),
                        SizedBox(height: 10),
                        Align(
                          alignment: Alignment.center,
                          child: TextButton(
                            onPressed: () => Get.to(() => const LoginScreen()),
                            child: Text(
                              'Already have an Account?'.toUpperCase(),
                              style: GoogleFonts.poppins(color: tDarkColor),
                            ),
                          ),
                        ),
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
