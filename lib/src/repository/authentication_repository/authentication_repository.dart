// ignore_for_file: unused_catch_clause, empty_catches, prefer_const_constructors, avoid_print

import 'package:flutter_firebase_auth/src/features/authentication/screens/inner_pages/dashboard_screen.dart';
import 'package:flutter_firebase_auth/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:flutter_firebase_auth/src/repository/authentication_repository/exceptions/signup_email_password_failure.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser); //initilized firebase user
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const WelcomeScreen())
        : Get.offAll(() => const DashboardScreen());
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      // if user is login
      firebaseUser.value != null
          ? Get.offAll(() => const DashboardScreen())
          : Get.to(() => const WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      print('EXCEPTION - ${ex.message}');
      throw ex;
    }
  }

  //  Future<void> loginUserWithEmailAndPassword(
  //     String email, String password) async {
  //   try {
  //     await _auth.loginInUserWithEmailAndPassword(
  //         email: email, password: password);
  //   } on FirebaseAuthException catch(e)
  //   {
  //   }
  //    catch (e) {}
  // }

  Future<void> logout() async => await _auth.signOut();
}
