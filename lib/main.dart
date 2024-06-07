import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ridobike/Controller/databaseController.dart';
import 'package:ridobike/Controller/global_controller.dart';
import 'package:ridobike/Screens/buy_screen.dart';
import 'package:ridobike/Screens/car_details_screen.dart';
import 'package:ridobike/Screens/formScreen/formOne.dart';
import 'package:ridobike/Screens/new_home_screen.dart';
import 'package:ridobike/Screens/splash_screen.dart';
import 'package:ridobike/Utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(GlobalController());
    Get.put(DataBaseController());
    return MaterialApp(
      title: 'RidoBike',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: colorPrimary),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
