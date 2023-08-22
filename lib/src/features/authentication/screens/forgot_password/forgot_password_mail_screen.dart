// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/src/features/authentication/screens/forgot_password/otp_screen.dart';
import 'package:flutter_firebase_auth/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common_widgets/common_widgets.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';

class ForgotPasswordMailScreen extends StatefulWidget {
  const ForgotPasswordMailScreen({super.key});

  @override
  State<ForgotPasswordMailScreen> createState() =>
      _ForgotPasswordMailScreenState();
}

class _ForgotPasswordMailScreenState extends State<ForgotPasswordMailScreen> {
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
                        Icon(
                          Icons.password_outlined,
                          size: 50,
                        ),
                        Text(
                          'Forgot Password?',
                          style: GoogleFonts.poppins(
                              color: tDarkColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                            'Don\'t worry enter your registered email id to recieve password reset link'),
                        SizedBox(height: 10),
                        Form(
                            child: Container(
                          padding: EdgeInsets.symmetric(vertical: 20.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  decoration: InputDecoration(
                                      prefixIcon:
                                          Icon(Icons.mail_outline_sharp),
                                      labelText: 'Email',
                                      hintText: 'Email',
                                      border: OutlineInputBorder()),
                                ),
                                SizedBox(height: 20),
                                FormButton(
                                  text: 'Next',
                                  onPress: () {
                                    Get.to(() => OtpScreen());
                                  },
                                ),
                              ]),
                        )),
                        Align(
                          alignment: Alignment.center,
                          child: TextButton(
                            onPressed: () =>
                                Get.to(() => const WelcomeScreen()),
                            child: Text(
                              'return home'.toUpperCase(),
                              style: GoogleFonts.poppins(color: tDarkColor),
                            ),
                          ),
                        ),
                      ],
                    )))));
  }
}
