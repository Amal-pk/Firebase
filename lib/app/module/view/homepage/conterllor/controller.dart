import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/app/module/view/homepage/model/model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController mobileControler = TextEditingController();

  Future<void> onAddButtonPressed(Details model) async {
    final CollectionReference users = FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser!.email.toString());

    final generatedID = await users.add(model.toJson());
    model.id = generatedID.id;
    await users.doc(generatedID.id).update(model.toJson());
    Get.back();
  }

  Future<void> onUpdateButtonPressed(Details model) async {
    final CollectionReference users = FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser!.email.toString());

    final id = model.id;
    await users.doc(id).update(model.toJson());
  }
}
