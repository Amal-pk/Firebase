import 'package:firebase_app/core/sized_box.dart';
import 'package:firebase_app/app/module/view/create_page/add_persons.dart';
import 'package:firebase_app/app/module/view/create_page/widgets/widgets.dart';
import 'package:firebase_app/app/module/view/login_page/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final authSignINController = Get.put(AuthenticationController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child:
                        Image.asset('asset/image/images-removebg-preview.png'),
                  ),
                  const Text(
                    'HELLO',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    'Singin On Your account',
                    style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                  height50,
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
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: (() {}),
                        child: const Text("Forgot Password"),
                      ),
                    ],
                  ),
                  height20,
                  Center(
                    child: ElevatedButton(
                      onPressed: (() async {
                        if (formkey.currentState!.validate()) {
                          await authSignINController.login(
                            emailController.text.trim(),
                            passwordController.text.trim(),
                          );
                        }
                      }),
                      child: const Text('Login'),
                    ),
                  ),
                  height20,
                  Center(
                    child: TextButton(
                      onPressed: (() {
                        Get.to(() => AddPerson());
                      }),
                      child: const Text('Create an Account'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
