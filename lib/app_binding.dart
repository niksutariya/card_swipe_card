import 'package:card_swipe_task/controller/home_controller.dart';
import 'package:card_swipe_task/controller/splash_controller.dart';
import 'package:get/get.dart';

class AppBidding implements Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
    Get.put<HomeController>(HomeController());
  }
}