import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ridobike/Utils/colors.dart';

import '../../Controller/databaseController.dart';
import '../../Controller/global_controller.dart';

import '../../Utils/utils.dart';
import '../car_details_screen.dart';
import 'formOne.dart';
import 'form_three.dart';
import 'form_two.dart';

class FormFour extends StatefulWidget {
  final String tableName;

  const FormFour({super.key, required this.tableName});

  @override
  State<FormFour> createState() => _FormFourState();
}
TextEditingController _searchKeyController = TextEditingController();
GlobalController controller = Get.find();
DataBaseController databaseController = Get.find();

class _FormFourState extends State<FormFour> {
  dynamic dbHelper;

  Future<void> fetchVariants(
      String brand, String model, String year) async {
    try {
      await databaseController.fetchTrim("cars_table",brand, model, year);
    } catch (error) {
      print('Error fetching models: $error');
      throw Exception('Error fetching models: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: PreferredSize(
        preferredSize: Size.zero,
        child: AppBar(
          backgroundColor: Colors.black54,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 8,
              ),
              // Icon(Icons.keyboard_backspace, color: colorBlack,),

              Obx(() {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              fullscreenDialog: true,
                              builder: (_) =>
                                  FormOne(tableName: widget.tableName),
                            ),
                          );
                        },
                        child: Container(
                          constraints: BoxConstraints(
                            minHeight: 26,
                            minWidth: 60,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey.shade100,
                              border: Border.all(
                                  color: Colors.grey.shade100, width: 0.6)),
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                controller.brand.value,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: "MontserratSemiBold",
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              fullscreenDialog: true,
                              builder: (_) =>
                                  FormTwo(tableName: widget.tableName),
                            ),
                          );
                        },
                        child: Container(
                          constraints: BoxConstraints(
                            minHeight: 26,
                            minWidth: 60,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey.shade100,
                              border: Border.all(
                                  color: Colors.grey.shade100, width: 0.6)),
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                controller.model.value,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: "MontserratSemiBold",
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              fullscreenDialog: true,
                              builder: (_) =>
                                  FormThree(tableName: widget.tableName),
                            ),
                          );
                        },
                        child: Container(
                          constraints: BoxConstraints(
                            minHeight: 26,
                            minWidth: 60,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: Colors.grey.shade100, width: 0.6)),
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                controller.year.value.toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: "MontserratSemiBold",
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigator.pop(context);
                          // Navigator.push(
                          //   context,
                          //   CupertinoPageRoute(
                          // fullscreenDialog: true,
                          //     builder: (_) =>
                          //         FormFour(vechileType: widget.vechileType),
                          //   ),
                          // );
                        },
                        child: Container(
                          constraints: BoxConstraints(
                            minHeight: 26,
                            minWidth: 60,
                          ),
                          decoration: BoxDecoration(
                              // color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: Colors.grey.shade100, width: 0.6)),
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                controller.variant.value,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: "MontserratSemiBold",
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                    ],
                  ),
                );
              }),


              SizedBox(
                height: 26,
              ),
              GestureDetector(
                onTap: ()async{

                  if (controller.variant.value != 'Variant') {

                    await databaseController.fetchData(
                      controller.brand.value,
                      controller.model.value,
                      controller.year.value.toString(),
                      controller.variant.value,
                        "cars_table"
                    );

                    print(databaseController.allvehicle);

                    final carData =
                        databaseController.allvehicle.first;

                    if (carData != null) {
                      // If car data exists, navigate to the CarDetailsScreen
                      print("njdnckdsnckdf");
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (_) => CarDetailsScreen(
                                carData: carData)),
                      );
                    } else {
                      // If car data doesn't exist, show a snackbar or any other feedback
                      showSnackBar(
                          'Car details not found.', context);
                    }
                  } else {
                    showSnackBar("Select Variant first", context);
                  }
                },
                child: const Text(
                  "Select Variant",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "MontserratBold",
                    fontSize: 18,
                    color: Colors.black,
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
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    style: const TextStyle(
                      fontFamily: "MontserratSemiBold",
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    controller: _searchKeyController,
                    autofocus: false,
                    onChanged: (value) {
                      setState(() {
                        databaseController.searchVariant(value);
                      });
                    },
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
              FutureBuilder<void>(
                future: fetchVariants(controller.brand.value,
                    controller.model.value, controller.year.value),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    print(snapshot.error); // Log the error to the console
                    return const Text("Error fetching brands");
                  } else {
                    final variants = databaseController.allTrims ?? [];
                    final searchBrands = databaseController.searchTrim ?? [];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8),
                      child: GridView.builder(
                        shrinkWrap: true,
                        // Use shrinkWrap to prevent infinite height error
                        physics: const NeverScrollableScrollPhysics(),
                        // Disable GridView scrolling
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          // Number of columns in the grid
                          // Aspect ratio of each item
                          crossAxisSpacing: 16,
                          // Horizontal spacing between grid items
                          mainAxisSpacing:
                              16, // Vertical spacing between grid items
                        ),
                        itemCount: _searchKeyController.text.isNotEmpty
                            ? searchBrands.length
                            : variants.length,
                        itemBuilder: (context, index) {
                          final variant = _searchKeyController.text.isNotEmpty
                              ? searchBrands[index]
                              : variants[index];
                          return GestureDetector(
                            onTap: () async{
                              controller.variant.value = variant;
                              if (controller.variant.value != 'Variant') {

                                await databaseController.fetchData(
                                    controller.brand.value,
                                    controller.model.value,
                                    controller.year.value.toString(),
                                    controller.variant.value,
                                    "cars_table"
                                );

                                print(databaseController.allvehicle);

                                final carData =
                                    databaseController.allvehicle.first;

                                if (carData != null) {
                                  // If car data exists, navigate to the CarDetailsScreen
                                  print("njdnckdsnckdf");
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (_) => CarDetailsScreen(
                                            carData: carData)),
                                  );
                                } else {
                                  // If car data doesn't exist, show a snackbar or any other feedback
                                  showSnackBar(
                                      'Car details not found.', context);
                                }
                              } else {
                                showSnackBar("Select Variant first", context);
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey.shade200,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                      variant.toString(),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontFamily: "MontserratSemiBold",
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
      ),
    );
  }
}

// class ArteonScreen extends StatefulWidget {
//   final String vechileType;
//
//   const ArteonScreen({super.key, required this.vechileType});
//
//   @override
//   State<ArteonScreen> createState() => _ArteonScreenState();
// }
//
// class _ArteonScreenState extends State<ArteonScreen> {
//   dynamic dbHelper;
//
//   @override
//   void initState() {
//     super.initState();
//     // Initialize the appropriate database helper based on the vehicle type
//     if (widget.vechileType == 'Car') {
//
//     } else if (widget.vechileType == 'Motorcycle') {
//
//     }
//   }
//
//   Future<List<String>> fetchVariants(
//       String brand, String model, int year) async {
//     try {
//       // Get all distinct variants
//       List<String> allVariants =
//           await dbHelper.searchVariantsByMakeModelYear(brand, model, year);
//       return allVariants;
//     } catch (error) {
//       print('Error fetching models: $error');
//       throw Exception('Error fetching models: $error');
//     }
//   }
//
//   Future<void> showVariantBottomModal(
//       BuildContext context, String brand, String model) async {
//     showModalBottomSheet(
//       context: context,
//       backgroundColor: Colors.red,
//       barrierColor: Colors.transparent,
//       isScrollControlled: true,
//       builder: (BuildContext context) {
//         return ClipRRect(
//           borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(16.0),
//             topRight: Radius.circular(16.0),
//           ),
//           child: Container(
//             constraints: BoxConstraints(
//                 maxHeight: MediaQuery.of(context).size.height * 0.8),
//             padding: const EdgeInsets.symmetric(vertical: 16.0),
//             decoration: const BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(16.0),
//                 topRight: Radius.circular(16.0),
//               ),
//             ),
//             child: SingleChildScrollView(
//               child: Column(
//                 children: <Widget>[
//                   Container(
//                     decoration: const BoxDecoration(),
//                     child: Center(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           const Text(
//                             "Select Variant",
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontFamily: "MontserratBold",
//                               fontSize: 18,
//                               color: Colors.black,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 6,
//                           ),
//                           const Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 32.0),
//                             child: Text(
//                               "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 fontFamily: "MontserratBold",
//                                 fontSize: 12,
//                                 color: Colors.black26,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 16,
//                           ),
//                           Container(
//                             height: 52,
//                             width: MediaQuery.of(context).size.width - 32,
//                             decoration: BoxDecoration(
//                               color: Colors.grey.shade200,
//                               borderRadius: BorderRadius.circular(100),
//                             ),
//                             child: Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 16.0),
//                               child: TextFormField(
//                                 style: const TextStyle(
//                                   fontFamily: "MontserratSemiBold",
//                                   fontSize: 14,
//                                   color: Colors.black,
//                                 ),
//                                 decoration: InputDecoration(
//                                   enabledBorder: InputBorder.none,
//                                   focusedBorder: InputBorder.none,
//                                   hintText: "Search Variant....",
//                                   hintStyle: TextStyle(
//                                     fontFamily: "MontserratSemiBold",
//                                     fontSize: 14,
//                                     color: Colors.grey.shade500,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 8,
//                           ),
//                           FutureBuilder<List<String>>(
//                             future: fetchVariants(controller.brand.value,
//                                 controller.model.value, int.parse(controller.year.value)),
//                             builder: (context, snapshot) {
//                               if (snapshot.connectionState ==
//                                   ConnectionState.waiting) {
//                                 return const CircularProgressIndicator();
//                               } else if (snapshot.hasError) {
//                                 print(snapshot
//                                     .error); // Log the error to the console
//                                 return const Text("Error fetching brands");
//                               } else {
//                                 final variants = snapshot.data ?? [];
//                                 return Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 16.0, vertical: 8),
//                                   child: GridView.builder(
//                                     shrinkWrap: true,
//                                     // Use shrinkWrap to prevent infinite height error
//                                     physics:
//                                         const NeverScrollableScrollPhysics(),
//                                     // Disable GridView scrolling
//                                     gridDelegate:
//                                         const SliverGridDelegateWithFixedCrossAxisCount(
//                                       crossAxisCount: 2,
//                                       // Number of columns in the grid
//                                       childAspectRatio: 2 / 1,
//                                       // Aspect ratio of each item
//                                       crossAxisSpacing: 16,
//                                       // Horizontal spacing between grid items
//                                       mainAxisSpacing:
//                                           16, // Vertical spacing between grid items
//                                     ),
//                                     itemCount: variants.length,
//                                     itemBuilder: (context, index) {
//                                       final variant = variants[index];
//                                       return GestureDetector(
//                                         onTap: () {
//                                           controller.variant.value = variant;
//                                           Navigator.pop(context);
//                                         },
//                                         child: Container(
//                                           decoration: BoxDecoration(
//                                             border: Border.all(
//                                               color: Colors.grey.shade200,
//                                               width: 1,
//                                             ),
//                                             borderRadius:
//                                                 BorderRadius.circular(12),
//                                           ),
//                                           child: Center(
//                                             child: Column(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.center,
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.center,
//                                               children: [
//                                                 Container(
//                                                   height: 36,
//                                                   width: 36,
//                                                   decoration: BoxDecoration(
//                                                     color: Colors.grey.shade200,
//                                                     shape: BoxShape.circle,
//                                                   ),
//                                                   child: const Icon(
//                                                     Icons.car_rental,
//                                                     size: 24,
//                                                     color: Colors.blue,
//                                                   ),
//                                                 ),
//                                                 const SizedBox(height: 8),
//                                                 Text(
//                                                   variant,
//                                                   textAlign: TextAlign.center,
//                                                   style: const TextStyle(
//                                                     fontFamily:
//                                                         "MontserratSemiBold",
//                                                     fontSize: 12,
//                                                     color: Colors.black,
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       );
//                                     },
//                                   ),
//                                 );
//                               }
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 width: MediaQuery.of(context).size.width * 0.75,
//                 height: MediaQuery.of(context).size.height * 0.5,
//                 decoration: BoxDecoration(
//                     color: Colors.black54,
//                     borderRadius:
//                         BorderRadius.only(bottomRight: Radius.circular(40))),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       height: 36,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 16.0),
//                       child: Icon(Icons.arrow_back_ios_new_outlined,
//                           color: Colors.white),
//                     ),
//                     SizedBox(
//                       height: 36,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Text(
//                             '\$ 35 845',
//                             style: TextStyle(
//                               color: Colors.yellow.shade800,
//                               fontSize: 22,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           SizedBox(
//                             width: 8,
//                           ),
//                           Container(
//                             height: 24,
//                             width: 24,
//                             decoration: BoxDecoration(
//                               color: Colors.transparent,
//                               border: Border.all(color: Colors.grey.shade800),
//                               borderRadius: BorderRadius.circular(1000.0),
//                             ),
//                             child: Center(
//                               child: Text(
//                                 '25',
//                                 style: TextStyle(
//                                   color: Colors.yellow.shade800,
//                                   fontSize: 12,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                       child: Text(
//                         'Arteon 2019',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 26,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     Image.asset(
//                       'assets/images/yellowCar.png',
//                       // Replace with your image asset
//                       height: 200,
//                       width: 400,
//                       fit: BoxFit.cover,
//                     ),
//                     SizedBox(height: 20),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 48.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             height: 4,
//                             width: 4,
//                             decoration: BoxDecoration(
//                                 color: colorWhite, shape: BoxShape.circle),
//                           ),
//                           SizedBox(
//                             width: 16,
//                           ),
//                           Container(
//                             height: 4,
//                             width: 4,
//                             decoration: BoxDecoration(
//                                 color: Colors.white54, shape: BoxShape.circle),
//                           ),
//                           SizedBox(
//                             width: 16,
//                           ),
//                           Container(
//                             height: 4,
//                             width: 4,
//                             decoration: BoxDecoration(
//                                 color: Colors.white54, shape: BoxShape.circle),
//                           ),
//                           SizedBox(
//                             width: 16,
//                           ),
//                           Container(
//                             height: 4,
//                             width: 4,
//                             decoration: BoxDecoration(
//                                 color: Colors.white54, shape: BoxShape.circle),
//                           )
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               Container(
//                 color: Color(0xff1e1e1f),
//                 width: MediaQuery.of(context).size.width * 0.25,
//                 height: MediaQuery.of(context).size.height * 0.5,
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 48,
//                     ),
//                     Icon(Icons.crop_free, color: Colors.white),
//                     SizedBox(
//                       height: 38,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 16.0),
//                       child: tabItem("Technology", false),
//                     ),
//                     SizedBox(
//                       height: 48,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 36.0),
//                       child: tabItem("Specification", false),
//                     ),
//                     SizedBox(
//                       height: 48,
//                     ),
//                     tabItem("Overview", true),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 36),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 36.0),
//             child: Text(
//               'The All-New Arteon.\nDesigned to Steal\nAttention.',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 24,
//               ),
//             ),
//           ),
//           SizedBox(height: 10),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 36.0),
//             child: Text(
//               'An evolution of the classic\nfastback design and interior\ncomfort.',
//               style: TextStyle(
//                 color: Colors.white54,
//                 fontSize: 16,
//               ),
//             ),
//           ),
//           SizedBox(height: 36),
//           Obx(() {
//             return GestureDetector(
//               onTap: () {
//                 showVariantBottomModal(
//                   context,
//                   controller.brand.value,
//                   controller.model.value,
//                 );
//               },
//               child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 36.0),
//                   child: Container(
//                     height: 60,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                         color: colorWhite,
//                         borderRadius: BorderRadius.circular(20)),
//                     child: Center(
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 26.0)
//                             .copyWith(right: 16),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Expanded(
//                                 child: Text(
//                               controller.variant.value != ""
//                                   ? controller.variant.value
//                                   : "Select Variant",
//                             )),
//                             GestureDetector(
//                               onTap: () async {
//                                 if (controller.variant.value != '') {
//                                   // Map<String, dynamic>? carData = await dbHelper.searchData(
//                                   //   controller.brand.value,  // Provide the make value
//                                   //   controller.model.value,
//                                   //   controller.year.value,
//                                   //   controller.variant.value,
//                                   // );
//
//                                   await databaseController.fetchData(
//                                     controller.brand.value,
//                                     controller.model.value,
//                                     controller.year.value.toString(),
//                                     controller.variant.value,
//                                     "dcdswd"
//                                   );
//
//                                   print(databaseController.allvehicle);
//
//                                   final carData =
//                                       databaseController.allvehicle.first;
//
//                                   if (carData != null) {
//                                     // If car data exists, navigate to the CarDetailsScreen
//                                     Navigator.push(
//                                       context,
//                                       CupertinoPageRoute(
//                                           fullscreenDialog: true,
//                                           builder: (_) => CarDetailsScreen(
//                                               carData: carData)),
//                                     );
//                                   } else {
//                                     // If car data doesn't exist, show a snackbar or any other feedback
//                                     showSnackBar(
//                                         'Car details not found.', context);
//                                   }
//                                 } else {
//                                   showSnackBar("Select Variant first", context);
//                                 }
//                               },
//                               child: Container(
//                                 height: 36,
//                                 width: 36,
//                                 decoration: BoxDecoration(
//                                     color: Colors.yellow.shade800,
//                                     borderRadius: BorderRadius.circular(12)),
//                                 child: Icon(
//                                   Icons.more_horiz,
//                                   color: colorBlack.withOpacity(0.5),
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   )),
//             );
//           })
//         ],
//       ),
//     );
//   }
// }
//
// Widget tabItem(String title, bool isSelected) {
//   return Transform.rotate(
//     angle: -3.142 * 0.5,
//     child: Column(
//       children: [
//         Text(
//           title,
//           style: TextStyle(
//             color: isSelected ? Colors.white : Colors.white54,
//             fontSize: 16,
//             fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//           ),
//         ),
//         SizedBox(height: 4),
//         if (isSelected)
//           Container(
//             height: 4,
//             width: 4,
//             decoration: BoxDecoration(
//               color: Colors.yellow,
//               shape: BoxShape.circle,
//             ),
//           )
//       ],
//     ),
//   );
// }
