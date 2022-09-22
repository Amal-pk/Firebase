import 'package:firebase_app/app/module/view/homepage/conterllor/controller.dart';
import 'package:firebase_app/app/module/view/homepage/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';

class CardFields extends StatelessWidget {
  const CardFields(
      {Key? key,
      required this.head,
      required this.text,
      required this.cntrlr,
      required this.homeController,
      required this.newList})
      : super(key: key);
  final HomeController homeController;
  final String head;
  final String text;
  final TextEditingController? cntrlr;
  final List<Details> newList;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      borderRadius: 20,
      childPadding: 20,
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                head,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
            ],
          ),
          const Divider(
            thickness: 2,
          ),
          const Spacer(),
          FittedBox(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
