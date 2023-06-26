import 'dart:math';

import 'package:camera/camera.dart';
import 'package:firebase_storage/firebase_storage.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import '/UI/game/message.dart';

import '../utils/notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class GameController extends GetxController {
  List<CameraDescription> camera = [];
  Rx<CameraController?> cameraController = Rx(null);
  Rx<XFile?> image = Rx(null);
  RxBool uploding = false.obs;

  @override
  void onInit() {
    startCamera();
    super.onInit();
    AppNotifications.initialize(flutterLocalNotificationsPlugin);
  }

  void startCamera() async {
    camera = await availableCameras();

    cameraController.value = CameraController(camera[0], ResolutionPreset.high,
        enableAudio: false, imageFormatGroup: ImageFormatGroup.jpeg);
    await cameraController.value!.initialize();
    cameraController.value!.getMinZoomLevel();

    cameraController.refresh();
  }

  void clickPicture() async {
    if (cameraController.value == null) {
      return;
    }
    cameraController.value!.setFlashMode(FlashMode.off);
    image.value = await cameraController.value!.takePicture();
    await cameraController.value!.pausePreview();
  }

  void uploadPic() async {
    uploding.value = true;
    uploding.refresh();
    try {
      String dateTime = DateTime.now().toIso8601String();
      String randomInt = Random().nextInt(1000).toString();
      await FirebaseStorage.instance
          .ref('images/${dateTime}_$randomInt')
          .putData(await image.value!.readAsBytes());
      Get.to(const MessagePage());
      trigetNotification();
    } catch (e) {
      Get.snackbar('Failed!', 'Failed to fead the animal place try once again');
    }
    uploding.value = false;
    uploding.refresh();
  }

  void trigetNotification() {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestPermission();

    AppNotifications.showNotification(
        title: "yeeeh...",
        body: "Thank you for sharing food with me",
        fln: flutterLocalNotificationsPlugin);
  }

  @override
  void onClose() {
    cameraController.value?.dispose();
    super.onClose();
  }
}
