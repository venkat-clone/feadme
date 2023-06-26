import 'package:get/get.dart';
import '/UI/home.dart';

class MessageController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Get.offAll(const HomePage());
    });
  }
}
