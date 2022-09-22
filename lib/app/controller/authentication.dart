// import 'dart:developer';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_app/app/module/view/homepage/homepage.dart';
// import 'package:firebase_app/app/module/view/login_page/login_page.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class AuthenticationController extends GetxController {
//   static AuthenticationController instance =
//       Get.put(AuthenticationController());
//   late Rx<User?> _user;
//   FirebaseAuth auth = FirebaseAuth.instance;
//   final CollectionReference storage = FirebaseFirestore.instance
//       .collection(FirebaseAuth.instance.currentUser!.email.toString());

// // @override
// //   void onInit() {
// //     super.onInit();
// //  storage = FirebaseFirestore.instance
// //       .collection(FirebaseAuth.instance.currentUser!.email.toString());

// //   }

//   @override
//   void onReady() {
//     super.onReady();
//     _user = Rx<User?>(auth.currentUser);
//     _user.bindStream(auth.userChanges());
//     ever(_user, _initialScreen);
//   }

//   _initialScreen(User? user) {
//     if (user == null) {
//       // print("Login Page");
//       Get.offAll(() =>  LoginPage());
//     } else {
//       Get.offAll(() => const HomePage());
//     }
//   }

//   void register(String email, password) async {
//     try {
//       await auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//     } catch (e) {
//       Get.snackbar(
//         "About User",
//         "User Message",
//         backgroundColor: Colors.grey,
//         snackPosition: SnackPosition.BOTTOM,
//         titleText: const Text(
//           "Account creation failed",
//           style: TextStyle(
//             color: Colors.white,
//           ),
//         ),
//         messageText: Text(
//           e.toString(),
//           style: const TextStyle(
//             color: Colors.white,
//           ),
//         ),
//       );
//     }
//   }

//   void login(String email, password) async {
//     try {
//       log("login try");
//       await auth.signInWithEmailAndPassword(email: email, password: password);
//     } catch (e) {
//       Get.snackbar(
//         "About Login",
//         "Login Message",
//         backgroundColor: Colors.grey,
//         snackPosition: SnackPosition.BOTTOM,
//         titleText: const Text(
//           "Account Login failed",
//           style: TextStyle(
//             color: Colors.white,
//           ),
//         ),
//         messageText: Text(
//           e.toString(),
//           style: const TextStyle(
//             color: Colors.white,
//           ),
//         ),
//       );
//     }
//   }

//   void logout() async {
//     await auth.signOut();
//   }

//   void addPerson(name, age, email, phoneNumber) async {
//     await storage.add({
//       "name": name,
//       "age": age,
//       "email": email,
//       "phonenumber": phoneNumber,
//     });
//   }
// }
