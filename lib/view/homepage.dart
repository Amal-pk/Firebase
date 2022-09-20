import 'package:firebase_app/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image(
            image: AssetImage("asset/image/images-removebg-preview.png"),
          ),
          ElevatedButton(
              onPressed: (() {
                Get.to(() => LoginPage());
              }),
              child: Text("Logout"))
        ],
      ),
    );
  }
}
