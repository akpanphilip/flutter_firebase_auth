import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';

class ResetOpt extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  const ResetOpt({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade200),
        child: Row(
          children: [
            Icon(icon, size: 50),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: GoogleFonts.poppins(
                        color: tDarkColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w700)),
                Text(subtitle,
                    style: GoogleFonts.poppins(
                        color: tDarkColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w400))
              ],
            )
          ],
        ),
      ),
    );
  }
}

// form submit button
class FormButton extends StatelessWidget {
  final String text;
  const FormButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: OutlinedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            foregroundColor: tWhiteColor,
            backgroundColor: tSecondaryColor,
            side: BorderSide(color: tSecondaryColor),
            padding: EdgeInsets.symmetric(vertical: 20),
          ),
          onPressed: () {},
          child: Text(text.toUpperCase())),
    );
  }
}
