import 'package:firebase_app/core/sized_box.dart';
import 'package:firebase_app/app/module/view/create_page/widgets/widgets.dart';
import 'package:firebase_app/app/module/view/homepage/conterllor/controller.dart';
import 'package:firebase_app/app/module/view/homepage/model/model.dart';
import 'package:firebase_app/app/module/view/login_page/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum AddOrEdit { add, edit }

class CreateFields extends StatelessWidget {
  CreateFields(
      {Key? key,
      required this.homeController,
      this.type = AddOrEdit.add,
      required this.model})
      : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final HomeController homeController;
  String id = '';
  final AddOrEdit type;
  final Details model;
  final authController = Get.put(AuthenticationController());
  @override
  Widget build(BuildContext context) {
    if (type == AddOrEdit.edit) {
      emailController.text = model.email.toString();
      nameController.text = model.name.toString();
      ageController.text = model.age.toString();
      phoneController.text = model.phonenumber.toString();
      id = model.id.toString();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.11),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 40,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 35),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
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
                      ElevatedButton(
                        onPressed: () async {
                          final models = Details(
                            age: ageController.text.trim(),
                            email: emailController.text.trim(),
                            phonenumber: phoneController.text.trim(),
                            name: nameController.text.trim(),
                            id: id,
                          );
                          // if (type == AddOrEdit.add) {
                          await homeController.onUpdateButtonPressed(models);
                          // } else {
                          //   homeController.onUpdateButtonPressed(modelss);
                          // }
                        },
                        child: const Text('add'),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
