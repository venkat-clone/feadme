import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/controllers/message_controller.dart';
import '../../utils/colors.dart';

class MessagePage extends GetView<MagnifierController> {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MessageController());
    return const Scaffold(
        body: SafeArea(
            child: Center(
      child: Text(
        'GOOD JOB',
        style: TextStyle(
            fontSize: 48,
            fontFamily: 'Lilita_One',
            letterSpacing: 4.8,
            fontWeight: FontWeight.w400,
            color: primary),
      ),
    )));
  }
}
