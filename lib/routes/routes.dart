import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpmbs/views/user/user_details_screen.dart';

import '../views/splash_screen.dart';
import '../views/user/user_screen.dart';

class Routes {
  static const String userScreen = 'user_screen';
  static const String userDetailScreen = 'user_details_screen';
  static const String splashScreen = 'splash_screen';


  static Route routesGenerator(RouteSettings settings) {

    switch (settings.name) {
      case splashScreen:
        return GetPageRoute(
          page: () => SplashScreen(),
          settings: settings,
        );

      case userScreen:
        return GetPageRoute(
          page: () => UserScreen(),
          settings: settings,
        );


      case userDetailScreen:
        return GetPageRoute(
          page: () => UserDetailScreen(),
          settings: settings,
        );

      // case homeScreen:
      //   return GetPageRoute(
      //     page: () => HomeScreen(),
      //     settings: settings,
      //   );

      default:
        return MaterialPageRoute(
          builder: (context) {
            return const Scaffold(
              body: Center(
                  child: Text(
                    'Error Screen is undergoing',
                    //style: AppTextStyle.descTextStyle,
                  )),
            );
          },
        );
    }
  }
}
