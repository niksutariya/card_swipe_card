import 'package:card_swipe_task/utils/app_colors.dart';
import 'package:card_swipe_task/utils/sizeutils.dart';
import 'package:card_swipe_task/widget/custom_text.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    return Scaffold(
      backgroundColor: AppColors.splashColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            const CircularProgressIndicator(
              color: AppColors.whiteColor,
            ),
            SizedBox(
              height: SizeUtils.horizontalBlockSize * 3,
            ),
             CustomText(
              title: "Loading...",
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w800,
               fontSize: SizeUtils.fSize_18(),
            )
          ],
        ),
      ),
    );
  }
}
