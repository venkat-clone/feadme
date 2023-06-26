import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/colors.dart';

import 'game/game.dart';

class HomePage extends GetView {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SafeArea(
                child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            Get.to(const GamePage());
          },
          child: Container(
            decoration: BoxDecoration(
                color: primary, borderRadius: BorderRadius.circular(30)),
            padding: const EdgeInsets.all(15),
            child: const Text(
              'Share your meal',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Andika',
                fontWeight: FontWeight.w400,
                fontSize: 25,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: double.infinity,
          height: 30,
        ),
      ],
    ))));
  }
}
