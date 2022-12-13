import 'package:card_swipe_task/module/home_screen/googlemap_screen.dart';
import 'package:card_swipe_task/module/home_screen/home_screen.dart';
import 'package:card_swipe_task/module/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

mixin Routes {
  static const defaultTransition = Transition.rightToLeft;
  static const downToUpTransition = Transition.downToUp;

  // get started
  static const String homeScreen = '/HomeScreen';
  static const String splashScreen = '/SplashScreen';
  static const String mapScreen = '/MapScreen';

  static List<GetPage<dynamic>> pages = [
    GetPage<dynamic>(
      name: splashScreen,
      page: () => const SplashScreen(),
      transition: defaultTransition,
    ),GetPage<dynamic>(
      name: homeScreen,
      page: () => HomeScreen(),
      transition: defaultTransition,
    ),GetPage<dynamic>(
      name: mapScreen,
      page: () => MapScreen(),
      transition: defaultTransition,
    ),
  ];
}
