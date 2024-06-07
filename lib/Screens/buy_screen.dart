
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ridobike/Controller/global_controller.dart';
import 'package:ridobike/Utils/colors.dart';
import 'package:ridobike/Utils/utils.dart';
import 'package:ridobike/Widgets/buy_input_field.dart';
import 'car_details_screen.dart';

class BuyScreen extends StatefulWidget {
  final String vechileType;
  const BuyScreen({super.key, required this.vechileType});

  @override
  State<BuyScreen> createState() => _BuyScreenState();
}

class _BuyScreenState extends State<BuyScreen> {

  dynamic dbHelper;


  @override
  void initState() {
    super.initState();
    // Initialize the appropriate database helper based on the vehicle type
    if (widget.vechileType == 'Car') {
      // dbHelper = DatabaseHelper();
    } else if (widget.vechileType == 'Motorcycle') {
      // dbHelper = DatabaseHelperMotorCycle();
    }
  }

  GlobalController controller = Get.find();

  Future<List<String>> fetchBrands() async {
    try {
      // Get all distinct makes
      List<String> allMakes = await dbHelper.getAllMakes();
      return allMakes;
    } catch (error) {
      print('Error fetching brands: $error');
      throw Exception('Error fetching brands $error');
    }
  }

  Future<List<String>> fetchModels(String brand) async {
    try {
      // Get all distinct makes
      List<String> allBrands = await dbHelper.searchModelsByMake(brand);
      return allBrands;
    } catch (error) {
      print('Error fetching brands: $error');
      throw Exception('Error fetching brands: $error');
    }
  }

  Future<List<int>> fetchYears(String brand, String model) async {
    try {
      // Get all distinct makes
      List<int> allYears = await dbHelper.searchYearsByMakeAndModel(brand, model);
      return allYears;
    } catch (error) {
      print('Error fetching models: $error');
      throw Exception('Error fetching models: $error');
    }
  }

  Future<List<String>> fetchVariants(String brand, String model, int year) async {
    try {
      // Get all distinct variants
      List<String> allVariants = await dbHelper.searchVariantsByMakeModelYear(brand, model, year);
      return allVariants;
    } catch (error) {
      print('Error fetching models: $error');
      throw Exception('Error fetching models: $error');
    }
  }


  Future<void> showBottomModal(BuildContext context) async {
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
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.8),
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
                              color: Colors.black,
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
                                  color: Colors.black,
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
                          FutureBuilder<List<String>>(
                            future: fetchBrands(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                print(snapshot
                                    .error); // Log the error to the console
                                return const Text("Error fetching brands");
                              } else {
                                final brands = snapshot.data ?? [];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 8),
                                  child: GridView.builder(
                                    shrinkWrap: true,
                                    // Use shrinkWrap to prevent infinite height error
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    // Disable GridView scrolling
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      // Number of columns in the grid
                                      childAspectRatio: 2 / 1,
                                      // Aspect ratio of each item
                                      crossAxisSpacing: 16,
                                      // Horizontal spacing between grid items
                                      mainAxisSpacing:
                                          16, // Vertical spacing between grid items
                                    ),
                                    itemCount: brands.length,
                                    itemBuilder: (context, index) {
                                      final brand = brands[index];
                                      return GestureDetector(
                                        onTap: () {
                                          controller.brand.value = brand;
                                          controller.model.value = '';
                                          controller.year.value = '2024';
                                          // controller.trim.value = '';
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey.shade200,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Center(
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
                                                    color: Colors.grey.shade200,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: const Icon(
                                                    Icons.car_rental,
                                                    size: 24,
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                                const SizedBox(height: 8),
                                                Text(
                                                  brand,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    fontFamily:
                                                        "MontserratSemiBold",
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              }
                            },
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

  Future<void> showModelBottomModal(BuildContext context, String brand) async {
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
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.8),
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
                            "Select your Model",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "MontserratBold",
                              fontSize: 18,
                              color: Colors.black,
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
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintText: "Search Models....",
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
                          FutureBuilder<List<String>>(
                            future: fetchModels(brand),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                print(snapshot
                                    .error); // Log the error to the console
                                return const Text("Error fetching brands");
                              } else {
                                final models = snapshot.data ?? [];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 8),
                                  child: GridView.builder(
                                    shrinkWrap: true,
                                    // Use shrinkWrap to prevent infinite height error
                                    physics:
                                    const NeverScrollableScrollPhysics(),
                                    // Disable GridView scrolling
                                    gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      // Number of columns in the grid
                                      childAspectRatio: 2 / 1,
                                      // Aspect ratio of each item
                                      crossAxisSpacing: 16,
                                      // Horizontal spacing between grid items
                                      mainAxisSpacing:
                                      16, // Vertical spacing between grid items
                                    ),
                                    itemCount: models.length,
                                    itemBuilder: (context, index) {
                                      final model = models[index];
                                      return GestureDetector(
                                        onTap: () {
                                          controller.model.value = model;
                                          controller.year.value = '2024';
                                          // controller.trim.value = '';

                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey.shade200,
                                              width: 1,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(12),
                                          ),
                                          child: Center(
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
                                                    color: Colors.grey.shade200,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: const Icon(
                                                    Icons.car_rental,
                                                    size: 24,
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                                const SizedBox(height: 8),
                                                Text(
                                                  model,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    fontFamily:
                                                    "MontserratSemiBold",
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              }
                            },
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

  Future<void> showYearBottomModal(BuildContext context, String brand, String model) async {
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
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.8),
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
                            "Select Year",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "MontserratBold",
                              fontSize: 18,
                              color: Colors.black,
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
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintText: "Search Year....",
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
                          FutureBuilder<List<int>>(
                            future: fetchYears(controller.brand.value, controller.model.value),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                print(snapshot
                                    .error); // Log the error to the console
                                return const Text("Error fetching brands");
                              } else {
                                final years = snapshot.data ?? [];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 8),
                                  child: GridView.builder(
                                    shrinkWrap: true,
                                    // Use shrinkWrap to prevent infinite height error
                                    physics:
                                    const NeverScrollableScrollPhysics(),
                                    // Disable GridView scrolling
                                    gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      // Number of columns in the grid
                                      childAspectRatio: 2 / 1,
                                      // Aspect ratio of each item
                                      crossAxisSpacing: 16,
                                      // Horizontal spacing between grid items
                                      mainAxisSpacing:
                                      16, // Vertical spacing between grid items
                                    ),
                                    itemCount: years.length,
                                    itemBuilder: (context, index) {
                                      final year = years[index];
                                      return GestureDetector(
                                        onTap: () {
                                          controller.year.value = year.toString();
                                          // controller.trim.value = '';
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey.shade200,
                                              width: 1,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(12),
                                          ),
                                          child: Center(
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
                                                    color: Colors.grey.shade200,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: const Icon(
                                                    Icons.car_rental,
                                                    size: 24,
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                                const SizedBox(height: 8),
                                                Text(
                                                  year.toString(),
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    fontFamily:
                                                    "MontserratSemiBold",
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              }
                            },
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

  Future<void> showVariantBottomModal(BuildContext context, String brand, String model) async {
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
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.8),
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
                            "Select Variant",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "MontserratBold",
                              fontSize: 18,
                              color: Colors.black,
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
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintText: "Search Variant....",
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
                          FutureBuilder<List<String>>(
                            future: fetchVariants(controller.brand.value, controller.model.value, int.parse(controller.year.value)),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                print(snapshot
                                    .error); // Log the error to the console
                                return const Text("Error fetching brands");
                              } else {
                                final variants = snapshot.data ?? [];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 8),
                                  child: GridView.builder(
                                    shrinkWrap: true,
                                    // Use shrinkWrap to prevent infinite height error
                                    physics:
                                    const NeverScrollableScrollPhysics(),
                                    // Disable GridView scrolling
                                    gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      // Number of columns in the grid
                                      childAspectRatio: 2 / 1,
                                      // Aspect ratio of each item
                                      crossAxisSpacing: 16,
                                      // Horizontal spacing between grid items
                                      mainAxisSpacing:
                                      16, // Vertical spacing between grid items
                                    ),
                                    itemCount: variants.length,
                                    itemBuilder: (context, index) {
                                      final variant = variants[index];
                                      return GestureDetector(
                                        onTap: () {
                                          controller.variant.value = variant;
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey.shade200,
                                              width: 1,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(12),
                                          ),
                                          child: Center(
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
                                                    color: Colors.grey.shade200,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: const Icon(
                                                    Icons.car_rental,
                                                    size: 24,
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                                const SizedBox(height: 8),
                                                Text(
                                                  variant,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    fontFamily:
                                                    "MontserratSemiBold",
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              }
                            },
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
            backgroundColor: colorPrimary,
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Obx(() {
                return Column(
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
                      "Buy Cars",
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
                          showBottomModal(context);
                        },
                        child: BuyInputField(
                          title: "Brand Name",
                          fieldValue: controller.brand.value != ''
                              ? controller.brand.value
                              : "Select Brand",
                          isSelectable: true,
                        )),
                    GestureDetector(
                      onTap: () async{

                        controller.brand.value != ''
                            ? showModelBottomModal(context, controller.brand.value)
                            : showSnackBar("Select Brand First", context);
                      },
                      child:  BuyInputField(
                        title: "Model Name",
                        fieldValue: controller.model.value != ''
                            ? controller.model.value
                            :"Select Brand first",
                        isSelectable: true,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.model.value != ''
                            ? showYearBottomModal(context, controller.brand.value, controller.model.value)
                            : showSnackBar("Select Model First", context);
                      },
                      child: BuyInputField(
                        title: "Year",
                        fieldValue:  controller.year.value != 0
                            ? controller.year.value.toString():
                        "Select Model first",
                        isSelectable: true,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.year.value != ''
                            ? showVariantBottomModal(context, controller.brand.value, controller.model.value, )
                            : showSnackBar("Select Model First", context);
                      },
                      child: BuyInputField(
                        title: "Variant Name",
                        fieldValue: controller.variant.value != ''
                            ? controller.variant.value: "Select year first",
                        isSelectable: true,
                      ),
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
                      onTap: () async {
                        // Perform the search using your DatabaseHelper class
                        // if(controller.brand.value.isNotEmpty && controller.model.value.isNotEmpty && controller.year.value != 0 && controller.variant.value.isNotEmpty){
                        //   Map<String, dynamic>? carData = await dbHelper.searchData(
                        //     controller.brand.value,  // Provide the make value
                        //     controller.model.value,
                        //     controller.year.value,
                        //     controller.variant.value,
                        //   );
                        //
                        //   if (carData != null) {
                        //     // If car data exists, navigate to the CarDetailsScreen
                        //     Navigator.push(
                        //       context,
                        //       CupertinoPageRoute(builder: (_) => CarDetailsScreen(carData: carData)),
                        //     );
                        //   } else {
                        //     // If car data doesn't exist, show a snackbar or any other feedback
                        //     showSnackBar('Car details not found.', context);
                        //   }
                        // }else{
                        //   showSnackBar("Select all the values", context);
                        // }
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
                );
              })),
        ));
  }
}
