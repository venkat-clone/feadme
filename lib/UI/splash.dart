import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/splash_controller.dart';
import '../utils/colors.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: Obx(
      () => AnimatedOpacity(
        opacity: controller.opacity.value,
        duration: const Duration(milliseconds: 700),
        onEnd: controller.nextScreen,
        child: const Text(
          'My Pet',
          style: TextStyle(
            color: primary,
            fontFamily: 'Andika',
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ))));
  }
}
