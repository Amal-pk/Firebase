
import 'package:flutter/material.dart';

class TextFieldWidgets extends StatelessWidget {
  const TextFieldWidgets({
    Key? key,
    required this.hint,
    required this.validator,
    required this.controller,
    required this.keybord,
    required this.icon,
    this.obscure,
  }) : super(key: key);
  final TextEditingController? controller;
  final TextInputType keybord;
  final String hint;
  final String validator;
  final bool? obscure;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                spreadRadius: 5,
                blurRadius: 10,
                offset: const Offset(1, 1),
                color: Colors.grey.withOpacity(0.3),
              )
            ],
          ),
          child: TextFormField(
            controller: controller,
            obscureText: obscure ?? false,
            decoration: InputDecoration(
              hintText: hint,
              prefixIcon: Icon(
                icon,
                color: Colors.grey,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: Colors.white,
                  width: 0.1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: Colors.white,
                  width: 0.1,
                ),
              ),
            ),
            keyboardType: keybord,
          ),
        ),
      ],
    );
  }
}
