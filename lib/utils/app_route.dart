import 'package:card_swipe_task/example.dart';
import 'package:card_swipe_task/module/home_screen/home_screen.dart';
import 'package:get/get.dart';

mixin Routes {
  static const defaultTransition = Transition.rightToLeft;
  static const downToUpTransition = Transition.downToUp;

  // get started
  static const String homeScreen = '/HomeScreen';
  static const String examplePageWidget = '/ExamplePageWidget';

  static List<GetPage<dynamic>> pages = [
    GetPage<dynamic>(
      name: homeScreen,
      page: () => HomeScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: examplePageWidget,
      page: () => ExamplePageWidget(),
      transition: defaultTransition,
    ),
  ];
}
