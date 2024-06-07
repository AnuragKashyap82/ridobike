import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:ridobike/Screens/car_details_screen.dart';
import 'package:ridobike/Utils/colors.dart';
import 'package:ridobike/Widgets/buy_input_field.dart';

class SellScreen extends StatefulWidget {
  const SellScreen({super.key});

  @override
  State<SellScreen> createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {

  Future<void> showBottomModal() async {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.red,
      barrierColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
          child: Container(
            constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.8),
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Select your Brand",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "MontserratBold",
                              fontSize: 18,
                              color: colorBlack,
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 32.0),
                            child: Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "MontserratBold",
                                fontSize: 12,
                                color: Colors.black26,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Container(
                            height: 52,
                            width: MediaQuery.of(context).size.width - 32,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 16.0),
                              child: TextFormField(
                                style: const TextStyle(
                                  fontFamily: "MontserratSemiBold",
                                  fontSize: 14,
                                  color: colorBlack,
                                ),
                                decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintText: "Search Brands....",
                                  hintStyle: TextStyle(
                                    fontFamily: "MontserratSemiBold",
                                    fontSize: 14,
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 80,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade200,
                                              width: 1),
                                          borderRadius:
                                          BorderRadius.circular(12)),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    height: 36,
                                                    width: 36,
                                                    decoration: BoxDecoration(
                                                        color:
                                                        Colors.grey.shade200,
                                                        shape: BoxShape.circle),
                                                    child: const Icon(
                                                      Icons.car_rental,
                                                      size: 24,
                                                      color: colorPrimary,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 26,
                                                  ),
                                                  const Text(
                                                    "Maruti",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily:
                                                      "MontserratSemiBold",
                                                      fontSize: 12,
                                                      color: colorBlack,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 80,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade200,
                                              width: 1),
                                          borderRadius:
                                          BorderRadius.circular(12)),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    height: 36,
                                                    width: 36,
                                                    decoration: BoxDecoration(
                                                        color:
                                                        Colors.grey.shade200,
                                                        shape: BoxShape.circle),
                                                    child: const Icon(
                                                      Icons.car_rental,
                                                      size: 24,
                                                      color: colorPrimary,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 26,
                                                  ),
                                                  const Text(
                                                    "Hundai",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily:
                                                      "MontserratSemiBold",
                                                      fontSize: 14,
                                                      color: colorBlack,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 80,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade200,
                                              width: 1),
                                          borderRadius:
                                          BorderRadius.circular(12)),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    height: 36,
                                                    width: 36,
                                                    decoration: BoxDecoration(
                                                        color:
                                                        Colors.grey.shade200,
                                                        shape: BoxShape.circle),
                                                    child: const Icon(
                                                      Icons.car_rental,
                                                      size: 24,
                                                      color: colorPrimary,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 26,
                                                  ),
                                                  const Text(
                                                    "Maruti",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily:
                                                      "MontserratSemiBold",
                                                      fontSize: 12,
                                                      color: colorBlack,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 80,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade200,
                                              width: 1),
                                          borderRadius:
                                          BorderRadius.circular(12)),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    height: 36,
                                                    width: 36,
                                                    decoration: BoxDecoration(
                                                        color:
                                                        Colors.grey.shade200,
                                                        shape: BoxShape.circle),
                                                    child: const Icon(
                                                      Icons.car_rental,
                                                      size: 24,
                                                      color: colorPrimary,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 26,
                                                  ),
                                                  const Text(
                                                    "Hundai",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily:
                                                      "MontserratSemiBold",
                                                      fontSize: 14,
                                                      color: colorBlack,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 80,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade200,
                                              width: 1),
                                          borderRadius:
                                          BorderRadius.circular(12)),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    height: 36,
                                                    width: 36,
                                                    decoration: BoxDecoration(
                                                        color:
                                                        Colors.grey.shade200,
                                                        shape: BoxShape.circle),
                                                    child: const Icon(
                                                      Icons.car_rental,
                                                      size: 24,
                                                      color: colorPrimary,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 26,
                                                  ),
                                                  const Text(
                                                    "Maruti",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily:
                                                      "MontserratSemiBold",
                                                      fontSize: 12,
                                                      color: colorBlack,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 80,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade200,
                                              width: 1),
                                          borderRadius:
                                          BorderRadius.circular(12)),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    height: 36,
                                                    width: 36,
                                                    decoration: BoxDecoration(
                                                        color:
                                                        Colors.grey.shade200,
                                                        shape: BoxShape.circle),
                                                    child: const Icon(
                                                      Icons.car_rental,
                                                      size: 24,
                                                      color: colorPrimary,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 26,
                                                  ),
                                                  const Text(
                                                    "Hundai",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily:
                                                      "MontserratSemiBold",
                                                      fontSize: 14,
                                                      color: colorBlack,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 80,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade200,
                                              width: 1),
                                          borderRadius:
                                          BorderRadius.circular(12)),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    height: 36,
                                                    width: 36,
                                                    decoration: BoxDecoration(
                                                        color:
                                                        Colors.grey.shade200,
                                                        shape: BoxShape.circle),
                                                    child: const Icon(
                                                      Icons.car_rental,
                                                      size: 24,
                                                      color: colorPrimary,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 26,
                                                  ),
                                                  const Text(
                                                    "Maruti",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily:
                                                      "MontserratSemiBold",
                                                      fontSize: 12,
                                                      color: colorBlack,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 80,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade200,
                                              width: 1),
                                          borderRadius:
                                          BorderRadius.circular(12)),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    height: 36,
                                                    width: 36,
                                                    decoration: BoxDecoration(
                                                        color:
                                                        Colors.grey.shade200,
                                                        shape: BoxShape.circle),
                                                    child: const Icon(
                                                      Icons.car_rental,
                                                      size: 24,
                                                      color: colorPrimary,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 26,
                                                  ),
                                                  const Text(
                                                    "Hundai",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily:
                                                      "MontserratSemiBold",
                                                      fontSize: 14,
                                                      color: colorBlack,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 80,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade200,
                                              width: 1),
                                          borderRadius:
                                          BorderRadius.circular(12)),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    height: 36,
                                                    width: 36,
                                                    decoration: BoxDecoration(
                                                        color:
                                                        Colors.grey.shade200,
                                                        shape: BoxShape.circle),
                                                    child: const Icon(
                                                      Icons.car_rental,
                                                      size: 24,
                                                      color: colorPrimary,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 26,
                                                  ),
                                                  const Text(
                                                    "Maruti",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily:
                                                      "MontserratSemiBold",
                                                      fontSize: 12,
                                                      color: colorBlack,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 80,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade200,
                                              width: 1),
                                          borderRadius:
                                          BorderRadius.circular(12)),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    height: 36,
                                                    width: 36,
                                                    decoration: BoxDecoration(
                                                        color:
                                                        Colors.grey.shade200,
                                                        shape: BoxShape.circle),
                                                    child: const Icon(
                                                      Icons.car_rental,
                                                      size: 24,
                                                      color: colorPrimary,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 26,
                                                  ),
                                                  const Text(
                                                    "Hundai",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily:
                                                      "MontserratSemiBold",
                                                      fontSize: 14,
                                                      color: colorBlack,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 80,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade200,
                                              width: 1),
                                          borderRadius:
                                          BorderRadius.circular(12)),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    height: 36,
                                                    width: 36,
                                                    decoration: BoxDecoration(
                                                        color:
                                                        Colors.grey.shade200,
                                                        shape: BoxShape.circle),
                                                    child: const Icon(
                                                      Icons.car_rental,
                                                      size: 24,
                                                      color: colorPrimary,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 26,
                                                  ),
                                                  const Text(
                                                    "Maruti",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily:
                                                      "MontserratSemiBold",
                                                      fontSize: 12,
                                                      color: colorBlack,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 80,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade200,
                                              width: 1),
                                          borderRadius:
                                          BorderRadius.circular(12)),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    height: 36,
                                                    width: 36,
                                                    decoration: BoxDecoration(
                                                        color:
                                                        Colors.grey.shade200,
                                                        shape: BoxShape.circle),
                                                    child: const Icon(
                                                      Icons.car_rental,
                                                      size: 24,
                                                      color: colorPrimary,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 26,
                                                  ),
                                                  const Text(
                                                    "Hundai",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily:
                                                      "MontserratSemiBold",
                                                      fontSize: 14,
                                                      color: colorBlack,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 80,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade200,
                                              width: 1),
                                          borderRadius:
                                          BorderRadius.circular(12)),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    height: 36,
                                                    width: 36,
                                                    decoration: BoxDecoration(
                                                        color:
                                                        Colors.grey.shade200,
                                                        shape: BoxShape.circle),
                                                    child: const Icon(
                                                      Icons.car_rental,
                                                      size: 24,
                                                      color: colorPrimary,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 26,
                                                  ),
                                                  const Text(
                                                    "Maruti",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily:
                                                      "MontserratSemiBold",
                                                      fontSize: 12,
                                                      color: colorBlack,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 80,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade200,
                                              width: 1),
                                          borderRadius:
                                          BorderRadius.circular(12)),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    height: 36,
                                                    width: 36,
                                                    decoration: BoxDecoration(
                                                        color:
                                                        Colors.grey.shade200,
                                                        shape: BoxShape.circle),
                                                    child: const Icon(
                                                      Icons.car_rental,
                                                      size: 24,
                                                      color: colorPrimary,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 26,
                                                  ),
                                                  const Text(
                                                    "Hundai",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily:
                                                      "MontserratSemiBold",
                                                      fontSize: 14,
                                                      color: colorBlack,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 80,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade200,
                                              width: 1),
                                          borderRadius:
                                          BorderRadius.circular(12)),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    height: 36,
                                                    width: 36,
                                                    decoration: BoxDecoration(
                                                        color:
                                                        Colors.grey.shade200,
                                                        shape: BoxShape.circle),
                                                    child: const Icon(
                                                      Icons.car_rental,
                                                      size: 24,
                                                      color: colorPrimary,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 26,
                                                  ),
                                                  const Text(
                                                    "Maruti",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily:
                                                      "MontserratSemiBold",
                                                      fontSize: 12,
                                                      color: colorBlack,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 80,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade200,
                                              width: 1),
                                          borderRadius:
                                          BorderRadius.circular(12)),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    height: 36,
                                                    width: 36,
                                                    decoration: BoxDecoration(
                                                        color:
                                                        Colors.grey.shade200,
                                                        shape: BoxShape.circle),
                                                    child: const Icon(
                                                      Icons.car_rental,
                                                      size: 24,
                                                      color: colorPrimary,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 26,
                                                  ),
                                                  const Text(
                                                    "Hundai",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily:
                                                      "MontserratSemiBold",
                                                      fontSize: 14,
                                                      color: colorBlack,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                          const SizedBox(
                            height: 8,
                          ),

                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
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
                "India's biggest vehicle marketplace",
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: "MontserratBold",
                    color: Colors.black26),
              ),
              const Text(
                "Sell Cars",
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    fontFamily: "MontserratBold",
                    color: colorBlack),
              ),
              const SizedBox(
                height: 26,
              ),
              GestureDetector(
                onTap: () {
                  showBottomModal();
                },
                child: const BuyInputField(
                  title: "Brand Name",
                  fieldValue: "Select Brand",
                  isSelectable: true,
                ),
              ),
              const BuyInputField(
                title: "Model Name",
                fieldValue: "Select Brand first",
                isSelectable: true,
              ),
              const BuyInputField(
                title: "Variant Name",
                fieldValue: "Select Model first",
                isSelectable: true,
              ),
              const BuyInputField(
                title: "Year",
                fieldValue: "Select Year",
                isSelectable: true,
              ),
              const BuyInputField(
                title: "Ownership Serial No.",
                fieldValue: "Select Serial No.",
                isSelectable: true,
              ),
              const BuyInputField(
                title: "Total KM. Run",
                fieldValue: "Enter total Km. run",
                isSelectable: false,
              ),
              const SizedBox(
                height: 26,
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.push(context,
                  //     CupertinoPageRoute(builder: (_) => const CarDetailsScreen()));
                },
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: colorPrimary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Center(
                      child: Text(
                        "Evaluate Cost",
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: "MontserratBold",
                            color: colorWhite),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
