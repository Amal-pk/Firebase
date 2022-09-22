import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/app/module/view/homepage/homepage.dart';
import 'package:firebase_app/app/module/view/login_page/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// String uniqueEmail = FirebaseAuth.instance.currentUser!.email.toString();

class AuthenticationController extends GetxController {
  static AuthenticationController instance =
      Get.put(AuthenticationController());
  FirebaseAuth auth = FirebaseAuth.instance;
  late Rx<User?> _user;
  
  Stream<User?> stream() => auth.authStateChanges();
  // final CollectionReference storage =
  //     FirebaseFirestore.instance.collection();

// @override
//   void onInit() {
//     super.onInit();
//  storage = FirebaseFirestore.instance
//       .collection(FirebaseAuth.instance.currentUser!.email.toString());

//   }

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      // print("Login Page");
      Get.offAll(() => LoginPage());
    } else {
      Get.offAll(() => HomePage());
    }
  }

  Future<void> register(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar(
        "About User",
        "User Message",
        backgroundColor: Colors.grey,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text(
          "Account creation failed",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        messageText: Text(
          e.toString(),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
  }

  Future<void> login(String email, password) async {
    try {
      log("login try");
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar(
        "About Login",
        "Login Message",
        backgroundColor: Colors.grey,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text(
          "Account Login failed",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        messageText: Text(
          e.toString(),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
  }

  void logout() async {
    await auth.signOut();
  }

  // void addPerson(name, age, email, phoneNumber) async {
  //   await storage.add({
  //     "name": name,
  //     "age": age,
  //     "email": email,
  //     "phonenumber": phoneNumber,
  //   });
  // }
}
