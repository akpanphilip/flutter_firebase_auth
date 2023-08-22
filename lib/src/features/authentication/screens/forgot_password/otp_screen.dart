// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common_widgets/common_widgets.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../welcome/welcome_screen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(tDefaultSize),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(image: AssetImage(logoImage)),
                Icon(
                  Icons.password_outlined,
                  size: 50,
                ),
                Text(
                  'Verify your E-mail',
                  style: GoogleFonts.poppins(
                      color: tDarkColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 10),
                Text(
                  'Please Enter The 4 Digit Code Sent To \n support@gmail.com',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    children: [
                      OtpTextField(
                        mainAxisAlignment: MainAxisAlignment.center,
                        numberOfFields: 6,
                        fillColor: Colors.black.withOpacity(0.1),
                        filled: true,
                      ),
                      SizedBox(height: 20),
                      FormButton(
                        text: 'Next',
                        onPress: () {
                          Get.to(() => OtpScreen());
                        },
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () => Get.to(() => const WelcomeScreen()),
                    child: Text(
                      'return home'.toUpperCase(),
                      style: GoogleFonts.poppins(color: tDarkColor),
                    ),
                  ),
                ),
              ],
            )),
      ))),
    );
  }
}
