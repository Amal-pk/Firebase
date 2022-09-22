// import 'package:firebase_app/app/core/sized_box.dart';
// import 'package:flutter/material.dart';

// class TextFieldWidget extends StatelessWidget {
//   const TextFieldWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var emailController = TextEditingController();
//     var passwordController = TextEditingController();
//     return Column(
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(20),
//             boxShadow: [
//               BoxShadow(
//                 spreadRadius: 5,
//                 blurRadius: 10,
//                 offset: const Offset(1, 1),
//                 color: Colors.grey.withOpacity(0.3),
//               )
//             ],
//           ),
//           child: TextField(
//             controller: emailController,
//             decoration: InputDecoration(
//               hintText: 'Email',
//               prefixIcon: const Icon(
//                 Icons.email,
//                 color: Colors.grey,
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20),
//                 borderSide: const BorderSide(
//                   color: Colors.white,
//                   width: 0.1,
//                 ),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20),
//                 borderSide: const BorderSide(
//                   color: Colors.white,
//                   width: 0.1,
//                 ),
//               ),
//             ),
//             keyboardType: TextInputType.name,
//           ),
//         ),
//         height20,
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(20),
//             boxShadow: [
//               BoxShadow(
//                 spreadRadius: 5,
//                 blurRadius: 10,
//                 offset: const Offset(1, 1),
//                 color: Colors.grey.withOpacity(0.3),
//               )
//             ],
//           ),
//           child: TextField(
//             controller: passwordController,
//             obscureText: true,
//             decoration: InputDecoration(
//               hintText: 'Password',
//               prefixIcon: const Icon(Icons.password_rounded),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30),
//                 borderSide: const BorderSide(
//                   color: Colors.white,
//                   width: 0.1,
//                 ),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30),
//                 borderSide: const BorderSide(
//                   color: Colors.white,
//                   width: 0.1,
//                 ),
//               ),
//             ),
//             keyboardType: TextInputType.visiblePassword,
//           ),
//         ),
//       ],
//     );
//   }
// }
