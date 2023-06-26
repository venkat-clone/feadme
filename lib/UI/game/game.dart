import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';

import '../../controllers/game_controller.dart';

class GamePage extends GetView<GameController> {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(GameController());

    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                color: primary,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: SafeArea(
            child: Column(
          children: [
            Image.asset(
              'assets/images/animal.png',
              height: MediaQuery.of(context).size.height * 0.3,
              fit: BoxFit.fill,
            ),
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(15),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(30))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  LayoutBuilder(builder: (context, constraints) {
                    final size = constraints.maxWidth * 00.7;
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/Spoon.png',
                          width: constraints.maxWidth * 0.1,
                        ),
                        SizedBox(
                          width: size,
                          height: size,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset('assets/images/corners.png'),
                              Container(
                                width: size * 0.95,
                                decoration: const BoxDecoration(
                                  color: Color(0xff404040),
                                  shape: BoxShape.circle,
                                ),
                                child:
                                    ObxValue<Rx<CameraController?>>((camera) {
                                  if (camera.value == null) {
                                    return const SizedBox();
                                  }
                                  return AspectRatio(
                                    aspectRatio: 1,
                                    child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(size / 2),
                                        child: CameraPreview(camera.value!)),
                                  );
                                }, controller.cameraController),
                              ),
                            ],
                          ),
                        ),
                        Image.asset('assets/images/fork.png',
                            width: constraints.maxWidth * 0.1),
                      ],
                    );
                  }),
                  Obx(() {
                    if (controller.image.value != null) {
                      return const Text(
                        'Will you eat this?',
                        style: TextStyle(
                          color: Color(0xff3C3C3C),
                          fontFamily: 'Andika',
                          fontSize: 24,
                        ),
                      );
                    }
                    return const Text(
                      'Click your meal',
                      style: TextStyle(
                        color: Color(0xff3C3C3C),
                        fontFamily: 'Andika',
                        fontSize: 24,
                      ),
                    );
                  }),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: primary,
                      shape: BoxShape.circle,
                    ),
                    child: Obx(() {
                      final bool imageIsNull = controller.image.value == null;
                      final bool isUploading = controller.uploding.value;
                      if (isUploading) {
                        return const CircularProgressIndicator(
                          color: Colors.white,
                          backgroundColor: primary,
                        );
                      } else if (imageIsNull) {
                        return GestureDetector(
                          onTap: controller.clickPicture,
                          child: const Icon(
                            Icons.camera_alt_rounded,
                            color: Colors.white,
                            size: 32,
                          ),
                        );
                      } else {
                        return GestureDetector(
                          onTap: controller.uploadPic,
                          child: const Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 32,
                          ),
                        );
                      }
                    }),
                  )
                ],
              ),
            ))
          ],
        )));
  }
}
