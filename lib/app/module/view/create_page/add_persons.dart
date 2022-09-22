import 'package:firebase_app/core/sized_box.dart';
import 'package:firebase_app/app/module/view/create_page/widgets/widgets.dart';
import 'package:firebase_app/app/module/view/homepage/conterllor/controller.dart';
import 'package:firebase_app/app/module/view/homepage/model/model.dart';
import 'package:firebase_app/app/module/view/login_page/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPerson extends StatelessWidget {
  AddPerson({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final authController = Get.put(AuthenticationController());
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset('asset/image/images-removebg-preview.png'),
                ),
                const Text(
                  'Create Your Account',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                height25,
                TextFieldWidgets(
                  controller: nameController,
                  hint: 'Name',
                  icon: Icons.person,
                  validator: '',
                  keybord: TextInputType.name,
                ),
                height20,
                TextFieldWidgets(
                  controller: ageController,
                  hint: 'Age',
                  icon: Icons.currency_yen_sharp,
                  validator: '',
                  keybord: TextInputType.number,
                ),
                height20,
                TextFieldWidgets(
                  controller: phoneController,
                  hint: 'Mobile Number',
                  icon: Icons.phone_android,
                  validator: '',
                  keybord: TextInputType.number,
                ),
                height20,
                TextFieldWidgets(
                  controller: emailController,
                  hint: 'Email',
                  icon: Icons.email,
                  validator: '',
                  keybord: TextInputType.emailAddress,
                ),
                height20,
                TextFieldWidgets(
                  obscure: true,
                  controller: passwordController,
                  hint: 'Password',
                  icon: Icons.password_sharp,
                  validator: '',
                  keybord: TextInputType.visiblePassword,
                ),
                height20,
                Center(
                  child: ElevatedButton(
                    onPressed: (() async {
                      // if (formkey.currentState!.validate()) {
                      await authController.register(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      );
                      final model = Details(
                        age: ageController.text.trim(),
                        name: nameController.text.trim(),
                        email: emailController.text.trim(),
                        phonenumber: phoneController.text.trim(),
                      );
                      await homeController.onAddButtonPressed(model);
                      // }
                    }),
                    child: const Text('create'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
