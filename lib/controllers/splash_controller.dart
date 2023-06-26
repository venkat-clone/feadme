import 'package:get/get.dart';
import '/UI/home.dart';

class SplashController extends GetxController {
  final opacity = 0.0.obs;
  @override
  void onReady() {
    opacity.value = 1;

    super.onReady();
  }

  void nextScreen() {
    Get.off(const HomePage());
  }
}
