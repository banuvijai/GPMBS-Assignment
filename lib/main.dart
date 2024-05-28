import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpmbs/routes/routes.dart';
import 'package:gpmbs/services/api_service.dart';
import 'package:gpmbs/views/user/user_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Dio dio= Dio();
  Get.put(APIServices(dio));
  runApp(const UserInfoApp());
}

class UserInfoApp extends StatelessWidget {
  const UserInfoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splashScreen,
      onGenerateRoute: Routes.routesGenerator,
      home:  UserScreen(),
      theme: ThemeData(
        hintColor: Colors.lightBlueAccent,
        scaffoldBackgroundColor: Colors.white,
        primarySwatch:Colors.grey
      ),
      //getPages: Routes.pages,
    );
  }
}
