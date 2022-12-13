import 'package:card_swipe_task/utils/app_route.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Get.offAllNamed(Routes.homeScreen);
      },
    );
    super.onInit();
  }
}
