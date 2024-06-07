import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ridobike/Screens/dashboard.dart';
import 'package:ridobike/Screens/home_screen.dart';
import 'package:ridobike/Screens/new_home_screen.dart';
import 'package:ridobike/Utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
            context, CupertinoPageRoute(builder: (_) => const NewHomeScreen()));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorWhite,
        appBar: PreferredSize(
          preferredSize: Size.zero,
          child: AppBar(
            backgroundColor: colorWhite,
          ),
        ),
        body: Stack(
          children: [
            Image.asset(
              "assets/images/carBg.jpg",
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Lottie.asset(
                          'assets/raw/splash.json',
                          width: 300,
                          height: 300,
                        ),
                        SizedBox(
                          height: 36,
                        ),
                        const Text(
                          "Let's start using this car price evaluation for better experience",
                          style: TextStyle(
                              fontSize: 24,
                              fontFamily: "MontserratBold",
                              color: colorBlack),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 36,
                        ),
                        const Text(
                          "Ridobike provides much better experience for the evaluation of the price of your car you have to buy or sell. So to start evaluating the price of your cars without any charges",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "MontserratBold",
                              color: Colors.black26),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 42,
                        ),
                        Container(
                          height: 52,
                          width: MediaQuery.of(context).size.width * 0.85,
                          decoration: BoxDecoration(
                              color: colorPrimary,
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                            child: Text(
                              "Get Started",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "MontserratBold",
                                  color: colorWhite),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
