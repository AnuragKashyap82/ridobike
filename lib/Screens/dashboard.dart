import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:ridobike/Screens/formScreen/formOne.dart';
import 'package:ridobike/Utils/colors.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: PreferredSize(
        preferredSize: Size.zero,
        child: AppBar(
          backgroundColor: colorPrimary,
          title: const Text(
            "Ridobike",
            style: TextStyle(
                fontSize: 18,
                fontFamily: "MontserratSemiBold",
                color: colorWhite),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 24,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    colorPrimary.withOpacity(0.8),
                    colorPrimary.withOpacity(0.2)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius:
                    BorderRadius.circular(0), // Optional: rounded corners
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Image.asset(
                          "assets/images/notification.png",
                          color: colorWhite.withOpacity(0.8),
                          width: 24,
                          height: 24,
                        )),
                  ),
                  Text("Price Evaluation",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "MontserratBold",
                        fontSize: 24,
                        color: colorWhite.withOpacity(0.8),
                      )),
                  Text(
                      "View evaluated price for old Vehicle",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "MontserratRegular",
                        fontSize: 12,
                        color: colorWhite.withOpacity(0.8),
                      )),
                  Expanded(
                      child: Image.asset(
                    "assets/images/car.png",
                    width: 240,
                    height: 240,
                  )),

                  ///Here
                  CustomShape()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            margin: EdgeInsets.only(top: 20.0),
            // Adjust the top margin to place the circle
            width: double.infinity,
            height: 360.0,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     Container(
                  //       constraints: BoxConstraints(minWidth: 100),
                  //       decoration: BoxDecoration(
                  //           color: colorWhite,
                  //           borderRadius: BorderRadius.circular(25)),
                  //       child: Center(
                  //         child: Padding(
                  //           padding: const EdgeInsets.all(8.0),
                  //           child: Text("Cars",
                  //               textAlign: TextAlign.center,
                  //               style: TextStyle(
                  //                 fontFamily: "MontserratSemiBold",
                  //                 fontSize: 12,
                  //                 color: colorBlack,
                  //               )),
                  //         ),
                  //       ),
                  //     ),
                  //     Text("Cars",
                  //         textAlign: TextAlign.center,
                  //         style: TextStyle(
                  //           fontFamily: "MontserratSemiBold",
                  //           fontSize: 12,
                  //           color: colorBlack.withOpacity(0.6),
                  //         )),
                  //     Text("Cars",
                  //         textAlign: TextAlign.center,
                  //         style: TextStyle(
                  //           fontFamily: "MontserratSemiBold",
                  //           fontSize: 12,
                  //           color: colorBlack.withOpacity(0.6),
                  //         )),
                  //     Text("Cars",
                  //         textAlign: TextAlign.center,
                  //         style: TextStyle(
                  //           fontFamily: "MontserratSemiBold",
                  //           fontSize: 12,
                  //           color: colorBlack.withOpacity(0.6),
                  //         )),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 16,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => FormOne(tableName: "Car")));
                        },
                        child: Items(
                          title: "Cars",
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => FormOne(tableName: "Motorcycle")));
                        },
                        child: Items(
                          title: "Motorcycle",
                        ),
                      ),
                      Items(
                        title: "Scooters",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 26,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Items(
                        title: "Electric Cars  ",
                      ),
                      Items(
                        title: "Electric Bikes  ",
                      ),
                      Items(
                        title: "Electric Scooter",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 36,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: colorPrimary.withOpacity(0.5),
                      ),
                      Text("Rating Guide",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "MontserratSemiBold",
                            fontSize: 12,
                            color: colorBlack.withOpacity(0.6),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        CircleAvatar(
            radius: 40.0,
            backgroundColor: Colors.white.withOpacity(0.9),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 72,
                  width: 72,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26, // Shadow color
                        blurRadius: 20.0, // Spread radius
                        offset: Offset(0, 4), // Shadow position
                      ),
                    ],
                    gradient: LinearGradient(
                      colors: [
                        colorPrimary.withOpacity(0.8),
                        colorPrimary.withOpacity(0.2)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    "assets/images/logo.png",
                    width: 72,
                    height: 72,
                  )),
            )),
      ],
    );
  }
}

class Items extends StatefulWidget {
  final String title;

  const Items({super.key, required this.title});

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    colorPrimary.withOpacity(0.8),
                    colorPrimary.withOpacity(0.2)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12)),
            child: Icon(
              Icons.car_rental,
              color: colorWhite,
            )),
        SizedBox(
          height: 6,
        ),
        Text(widget.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "MontserratSemiBold",
              fontSize: 12,
              color: colorBlack.withOpacity(0.6),
            )),
      ],
    );
  }
}
