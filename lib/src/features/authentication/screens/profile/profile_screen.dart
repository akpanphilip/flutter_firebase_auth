// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/src/constants/image_strings.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../constants/colors.dart';
import 'package:flutter_firebase_auth/src/repository/authentication_repository/authentication_repository.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(Icons.arrow_back_ios_new_rounded)),
          title: Text('Profile'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image(image: AssetImage(profile)),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'John Doe',
                  style: GoogleFonts.poppins(
                      color: tDarkColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 10),
                Text(
                  'johndoe@gmail.com',
                  style: GoogleFonts.poppins(
                      color: tDarkColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {},
                    style:
                        ElevatedButton.styleFrom(backgroundColor: tDarkColor),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text('Edit Profile',
                          style: GoogleFonts.poppins(
                              color: tWhiteColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Divider(),
                SizedBox(height: 10),

                // menu
                ProfileMenuWidget(
                  title: 'User Management',
                  icon: Icons.person_4_rounded,
                  onPress: () {},
                ),
                ProfileMenuWidget(
                  title: 'How to use',
                  icon: Icons.question_mark_rounded,
                  onPress: () {},
                ),
                ProfileMenuWidget(
                  title: 'Customer support',
                  icon: Icons.headphones_rounded,
                  onPress: () {},
                ),
                ProfileMenuWidget(
                  title: 'Settings',
                  icon: Icons.settings,
                  onPress: () {},
                ),
                ProfileMenuWidget(
                  title: 'Logout',
                  icon: Icons.logout_rounded,
                  onPress: () {
                    AuthenticationRepository.instance.logout();
                  },
                  endIcon: false,
                  textColor: Colors.red,
                ),
              ],
            ),
          ),
        ));
  }
}

class ProfileMenuWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;
  const ProfileMenuWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.grey.withOpacity(0.2)),
        child: Icon(icon),
      ),
      title: Text(title),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey.withOpacity(0.2)),
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 13,
              ),
            )
          : null,
    );
  }
}
