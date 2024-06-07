import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:ridobike/Screens/buy_screen.dart';
import 'package:ridobike/Screens/sell_screen.dart';
import 'package:ridobike/Utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Adjust duration as needed
    )..repeat(reverse: true); // Animation will repeat in both directions
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: PreferredSize(
        preferredSize: Size.zero,
        child: AppBar(
          backgroundColor: Colors.grey.shade100,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome",
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: "MontserratBold",
                    color: Colors.black26),
              ),
              const SizedBox(
                height: 6,
              ),
              const Text(
                "Buy and Sell cars",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: "MontserratBold",
                    color: colorBlack),
              ),
              const SizedBox(
                height: 26,
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      'assets/raw/splash.json',
                      width: 200,
                      height: 200,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 42.0),
                      child: Text(
                        "Are you looking to evaluate the sale cost of your old car. ",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "MontserratBold",
                            color: Colors.black26),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            CupertinoPageRoute(builder: (_) => const SellScreen()));
                      },
                      child: Container(
                        height: 52,
                        width: MediaQuery.of(context).size.width * 0.6,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            border: Border.all(color: colorPrimary, width: 2),
                            borderRadius: BorderRadius.circular(12)),
                        child: const Center(
                          child: Text(
                            "Evaluate Sell cost",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "MontserratBold",
                                color: colorPrimary),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(pi), // Mirror horizontally
                      child: Lottie.asset(
                        'assets/raw/splash.json',
                        width: 200,
                        height: 200,
                      ),
                    ),

                    const SizedBox(
                      height: 8,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 42.0),
                      child: Text(
                        "Are you looking to evaluate the buy cost of old car. ",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "MontserratBold",
                            color: Colors.black26),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            CupertinoPageRoute(builder: (_) => const BuyScreen(vechileType: "Car",)));
                      },
                      child: Container(
                        height: 52,
                        width: MediaQuery.of(context).size.width * 0.6,
                        decoration: BoxDecoration(
                            color: colorPrimary,
                            border: Border.all(color: colorPrimary, width: 2),
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(
                            "Evaluate Buy cost",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "MontserratBold",
                                color: Colors.grey.shade200),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
