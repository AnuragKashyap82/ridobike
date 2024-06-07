import 'package:flutter/material.dart';
import 'package:ridobike/Utils/colors.dart';

class BuyInputField extends StatelessWidget {
  final String title;
  final String fieldValue;
  final bool isSelectable;

  const BuyInputField(
      {super.key,
      required this.title,
      required this.fieldValue,
      required this.isSelectable});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 26.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 14,
                    fontFamily: "MontserratBold",
                    fontWeight: FontWeight.w800,
                    color: colorBlack),
              ),
              const Text(
                "Reset",
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: "MontserratBold",
                    color: colorPrimary),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 48,
            decoration: BoxDecoration(
              color: colorWhite,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      fieldValue,
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: "MontserratSemiBold",
                          color: colorBlack.withOpacity(0.7)),
                    ),
                    isSelectable
                        ? Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: colorBlack.withOpacity(0.7),
                      size: 16,
                    )
                        : const SizedBox()
                  ],
                ),
              ),
            ),
          )
          // Center(
          //   child: PopupMenuButton<int>(
          //     padding: EdgeInsets.zero,
          //     shadowColor: Colors.grey.shade100,
          //     surfaceTintColor: Colors.grey.shade100,
          //     color: colorWhite,
          //     clipBehavior: Clip.hardEdge,
          //     iconColor: colorPrimary,
          //     elevation: 12,
          //     constraints: BoxConstraints(
          //         maxWidth: MediaQuery.of(context).size.width - 32,
          //         maxHeight: MediaQuery.of(context).size.height * 0.5),
          //     shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(12)),
          //     itemBuilder: (context) => [
          //       PopupMenuItem<int>(
          //           padding: EdgeInsets.zero,
          //           onTap: () {},
          //           child:
          //           Container(
          //             decoration: const BoxDecoration(),
          //             child: const Center(
          //               child: Column(
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 crossAxisAlignment: CrossAxisAlignment.center,
          //                 children: [
          //                   Text(
          //                     "Select your Brand",
          //                     textAlign: TextAlign.center,
          //                     style: TextStyle(
          //                       fontFamily: "MontserratBold",
          //                       fontSize: 18,
          //                       color: colorBlack,
          //                     ),
          //                   ),
          //                   SizedBox(
          //                     height: 6,
          //                   ),
          //                   Padding(
          //                     padding: EdgeInsets.symmetric(horizontal: 32.0),
          //                     child: Text(
          //                       "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
          //                       textAlign: TextAlign.center,
          //                       style: TextStyle(
          //                         fontFamily: "MontserratBold",
          //                         fontSize: 12,
          //                         color: Colors.black26,
          //                       ),
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           )),
          //       PopupMenuItem<int>(
          //         padding: EdgeInsets.zero,
          //         onTap: () {},
          //         child: Center(
          //           child:
          //           Padding(
          //             padding: const EdgeInsets.symmetric(vertical: 8.0),
          //             child: Container(
          //               height: 52,
          //               width: MediaQuery.of(context).size.width - 64,
          //               decoration: BoxDecoration(
          //                 color: Colors.grey.shade200,
          //                 borderRadius: BorderRadius.circular(100),
          //               ),
          //               child: Padding(
          //                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
          //                 child: TextFormField(
          //                   style: TextStyle(
          //                     fontFamily: "MontserratSemiBold",
          //                     fontSize: 14,
          //                     color: colorBlack,
          //                   ),
          //                   decoration: InputDecoration(
          //                     enabledBorder: InputBorder.none,
          //                     focusedBorder: InputBorder.none,
          //                     hintText: "Search Brands....",
          //                     hintStyle: TextStyle(
          //                       fontFamily: "MontserratSemiBold",
          //                       fontSize: 14,
          //                       color: Colors.grey.shade500,
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //       PopupMenuItem<int>(
          //         padding: EdgeInsets.zero,
          //         onTap: () {},
          //         child: Padding(
          //           padding: const EdgeInsets.symmetric(horizontal: 16.0),
          //           child:
          //           Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               crossAxisAlignment: CrossAxisAlignment.center,
          //               children: [
          //                 Expanded(
          //                   child: Container(
          //                     height: 80,
          //                     decoration: BoxDecoration(
          //                         border: Border.all(
          //                             color: Colors.grey.shade200, width: 1),
          //                         borderRadius: BorderRadius.circular(12)),
          //                     child: Center(
          //                       child: Column(
          //                         mainAxisAlignment: MainAxisAlignment.center,
          //                         crossAxisAlignment: CrossAxisAlignment.center,
          //                         children: [
          //                           Center(
          //                             child: Column(
          //                               mainAxisAlignment:
          //                                   MainAxisAlignment.center,
          //                               crossAxisAlignment:
          //                                   CrossAxisAlignment.center,
          //                               children: [
          //                                 Container(
          //                                   height: 36,
          //                                   width: 36,
          //                                   decoration: BoxDecoration(
          //                                       color: Colors.grey.shade200,
          //                                       shape: BoxShape.circle),
          //                                   child: const Icon(
          //                                     Icons.car_rental,
          //                                     size: 24,
          //                                     color: colorPrimary,
          //                                   ),
          //                                 ),
          //                                 const SizedBox(
          //                                   width: 26,
          //                                 ),
          //                                 const Text(
          //                                   "Maruti",
          //                                   textAlign: TextAlign.center,
          //                                   style: TextStyle(
          //                                     fontFamily: "MontserratSemiBold",
          //                                     fontSize: 12,
          //                                     color: colorBlack,
          //                                   ),
          //                                 ),
          //                               ],
          //                             ),
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //                 SizedBox(
          //                   width: 16,
          //                 ),
          //                 Expanded(
          //                   child: Container(
          //                     height: 80,
          //                     decoration: BoxDecoration(
          //                         border: Border.all(
          //                             color: Colors.grey.shade200, width: 1),
          //                         borderRadius: BorderRadius.circular(12)),
          //                     child: Center(
          //                       child: Column(
          //                         mainAxisAlignment: MainAxisAlignment.center,
          //                         crossAxisAlignment: CrossAxisAlignment.center,
          //                         children: [
          //                           Center(
          //                             child: Column(
          //                               mainAxisAlignment:
          //                                   MainAxisAlignment.center,
          //                               crossAxisAlignment:
          //                                   CrossAxisAlignment.center,
          //                               children: [
          //                                 Container(
          //                                   height: 36,
          //                                   width: 36,
          //                                   decoration: BoxDecoration(
          //                                       color: Colors.grey.shade200,
          //                                       shape: BoxShape.circle),
          //                                   child: const Icon(
          //                                     Icons.car_rental,
          //                                     size: 24,
          //                                     color: colorPrimary,
          //                                   ),
          //                                 ),
          //                                 const SizedBox(
          //                                   width: 26,
          //                                 ),
          //                                 const Text(
          //                                   "Hundai",
          //                                   textAlign: TextAlign.center,
          //                                   style: TextStyle(
          //                                     fontFamily: "MontserratSemiBold",
          //                                     fontSize: 14,
          //                                     color: colorBlack,
          //                                   ),
          //                                 ),
          //                               ],
          //                             ),
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //               ]),
          //         ),
          //       ),
          //     ],
          //     child:
          //     Container(
          //       height: 48,
          //       decoration: BoxDecoration(
          //         color: colorWhite,
          //         borderRadius: BorderRadius.circular(12),
          //       ),
          //       child: Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 16.0),
          //         child: Center(
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             crossAxisAlignment: CrossAxisAlignment.center,
          //             children: [
          //               Text(
          //                 fieldValue,
          //                 style: TextStyle(
          //                     fontSize: 12,
          //                     fontFamily: "MontserratSemiBold",
          //                     color: colorBlack.withOpacity(0.7)),
          //               ),
          //               isSelectable
          //                   ? Icon(
          //                       Icons.arrow_forward_ios_rounded,
          //                       color: colorBlack.withOpacity(0.7),
          //                       size: 16,
          //                     )
          //                   : const SizedBox()
          //             ],
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
