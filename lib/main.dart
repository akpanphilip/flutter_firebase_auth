import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/firebase_options.dart';
import 'package:flutter_firebase_auth/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:flutter_firebase_auth/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:flutter_firebase_auth/src/repository/authentication_repository/authentication_repository.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // when app launches firebase is initiliazed with authentication repository
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const CircularProgressIndicator(),
    );
  }
}
