import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpmbs/widgets/app_widgets.dart';
import 'package:gpmbs/widgets/background_widget.dart';
import '../routes/routes.dart';
import '../utils/s.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {

    Future.delayed(const Duration(seconds:2),() async {
      Get.toNamed(Routes.userScreen);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackGroundWidget(),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.45,
          left: MediaQuery.of(context).size.width * 0.26,
          child: AppWidgets.buildText(text: 'SplashScreen',
          textStyle: S.textStyles.titleTextStyle(fontSize: 30)),
        )
      ],
    );
  }
}
