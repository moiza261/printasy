import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:social_app/views/homescreen/home_screen.dart';
import 'package:flutter/material.dart';

class Controllers {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  splasScreen(Widget screen) async {
    await Future.delayed(
      const Duration(seconds: 5),
      () {},
    );
    Get.to(() => screen);
  }

  void register(
      String name, String email, String password, Widget screen) async {
    try {
      if (email.isNotEmpty && password.length > 6) {
        final UserCredential user = await firebaseAuth
            .createUserWithEmailAndPassword(email: email, password: password);
        await firebaseFirestore.collection('users').doc(user.user!.uid).set({
          'name': name,
          'email': email,
          'password': password,
        });
        Get.snackbar('User Created', 'User is Created');
        Get.to(() => screen);
      } else {
        Get.showSnackbar(const GetSnackBar(
          title: 'Something esle wrong',
          message: 'Kindly enter correct email and password',
          duration: Duration(seconds: 2),
        ));
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar(e.toString(), e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signIn(
    String email,
    String password,
  ) async {
    try {
      if (email.isNotEmpty && password.length > 6) {
        final UserCredential user = await firebaseAuth
            .signInWithEmailAndPassword(email: email, password: password);
        Get.snackbar('User LoggedIn', 'User LoggedIn Successfully');
        Get.to(() => HomeScreen());
      } else {
        Get.showSnackbar(const GetSnackBar(
          title: 'Something esle wrong',
          message: 'Kindly enter correct email and password',
        ));
      }
    } catch (e) {
      print(e.toString());
    }
  }

  
}
