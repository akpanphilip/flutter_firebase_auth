// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/src/constants/colors.dart';
import 'package:flutter_firebase_auth/src/constants/image_strings.dart';
import 'package:flutter_firebase_auth/src/constants/sizes.dart';
import 'package:flutter_firebase_auth/src/features/authentication/screens/forgot_password/forgot_password_mail_screen.dart';
import 'package:flutter_firebase_auth/src/features/authentication/screens/inner_pages/dashboard_screen.dart';
import 'package:flutter_firebase_auth/src/features/authentication/screens/register/register_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common_widgets/common_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                PasswordResetModal(context);
                              },
                              child: Text(
                                'Forgot Password?',
                                style: GoogleFonts.poppins(color: tDarkColor),
                              ),
                            ),
                            TextButton(
                              onPressed: () =>
                                  Get.to(() => const RegisterScreen()),
                              child: Text(
                                'Sign Up',
                                style: GoogleFonts.poppins(color: tDarkColor),
                              ),
                            ),
                          ],
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
                              onPressed: () {
                                Get.to(() => DashboardScreen());
                              },
                              child: Text('Login'.toUpperCase())),
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
                                      Text('Sign up with Google'.toUpperCase()),
                                ))
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

  Future<dynamic> PasswordResetModal(BuildContext context) {
    return showModalBottomSheet(
        backgroundColor: Colors.white,
        context: context,
        builder: (context) => Container(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Password Reset!',
                    style: GoogleFonts.poppins(
                        color: tDarkColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'Select one of the options given below to reset your password.',
                    style: GoogleFonts.poppins(
                        color: tDarkColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 30),
                  ResetOpt(
                    onTap: () {
                      Navigator.pop(context);
                      Get.to(() => ForgotPasswordMailScreen());
                    },
                    icon: Icons.mail_outline_rounded,
                    title: 'E-Mail',
                    subtitle: 'Reset via Mail Verification',
                  ),
                  SizedBox(height: 10),
                  ResetOpt(
                    icon: Icons.mobile_friendly_rounded,
                    title: 'OTP',
                    subtitle: 'Reset via Phone Verification',
                    onTap: () {},
                  ),
                ],
              ),
            ));
  }
}
