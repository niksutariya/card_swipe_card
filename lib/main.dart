import 'package:card_swipe_task/utils/app_route.dart';
import 'package:card_swipe_task/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ));
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return GetMaterialApp(
      theme: ThemeData(hoverColor: Colors.transparent, splashColor: Colors.transparent),
      debugShowCheckedModeBanner: false,
      title: AppString.appName,
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: child,
          ),
        );
      },
      initialRoute: Routes.homeScreen,
      getPages: Routes.pages,
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
