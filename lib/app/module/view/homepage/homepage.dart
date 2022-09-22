import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/core/sized_box.dart';
import 'package:firebase_app/app/module/view/homepage/conterllor/controller.dart';
import 'package:firebase_app/app/module/view/homepage/model/model.dart';
import 'package:firebase_app/app/module/view/homepage/widget/custom.dart';
import 'package:firebase_app/app/module/view/login_page/controller/controller.dart';
import 'package:firebase_app/app/module/view/login_page/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widget/widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final AuthenticationController authController =
      Get.put(AuthenticationController());
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final CollectionReference users = FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser!.email.toString());
    return StreamBuilder<User?>(
      stream: authController.stream(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LoginPage();
        }
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              IconButton(
                onPressed: (() {
                  authController.logout();
                }),
                icon: const Icon(Icons.logout_sharp),
              )
            ],
          ),
          backgroundColor: Colors.white,
          body: StreamBuilder(
            stream: users.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (streamSnapshot.hasData) {
                final newList = streamSnapshot.data!.docs.map((e) {
                  return Details.fromJson(e.data() as Map<String, dynamic>);
                }).toList();
                final age = newList.first.age.toString();
                final email = newList.first.email.toString();
                final phone = newList.first.phonenumber.toString();
                final name = newList.first.name.toString();
                final id = newList.first.id.toString();
                return ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 5,
                              blurRadius: 10,
                              offset: const Offset(1, 1),
                              color: Colors.grey.withOpacity(1),
                            )
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.to(
                                () => CreateFields(
                                  homeController: _homeController,
                                  model: Details(
                                      age: age,
                                      email: email,
                                      phonenumber: phone,
                                      name: name,
                                      id: id),
                                  type: AddOrEdit.edit,
                                ),
                              );
                            },
                            icon: const Icon(Icons.edit),
                          ),
                          height50,
                          CardFields(
                            cntrlr: _homeController.nameController,
                            text: name,
                            head: 'Name',
                            homeController: _homeController,
                            newList: newList,
                          ),
                          CardFields(
                            newList: newList,
                            cntrlr: _homeController.ageController,
                            text: age,
                            head: 'Age',
                            homeController: _homeController,
                          ),
                          CardFields(
                            newList: newList,
                            cntrlr: _homeController.mobileControler,
                            text: phone,
                            head: 'Mobile',
                            homeController: _homeController,
                          ),
                          CardFields(
                            newList: newList,
                            cntrlr: _homeController.emailController,
                            text: email,
                            head: 'email',
                            homeController: _homeController,
                          ),
                          height50,
                        ],
                      ),
                    )
                  ],
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        );
      },
    );
  }
}
