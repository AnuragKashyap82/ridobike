import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ridobike/Utils/colors.dart';

import 'formScreen/formOne.dart';

class NewHomeScreen extends StatelessWidget {
  const NewHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      color: Color(0xfffa2d54),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 60,
                            ),
                            Text(
                              'Price Evaluation',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w900,
                                fontFamily: "MontserraBold",
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'View evaluated price for old vehicle',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontFamily: "MontserratSemiBold"),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      color: Colors.transparent,
                    )
                  ],
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 40,
                  child: Image.asset(
                    'assets/images/newCar.png',
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: MediaQuery.of(context).size.height * 0.35,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 0,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0).copyWith(bottom: 16),
              child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xff2b2f3c),
                      borderRadius: BorderRadius.circular(26)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32.0, vertical: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              FormOne(tableName: "cars_table")));
                                },
                                child: buildCategoryCard(
                                    Icons.directions_car, 'Cars           ')),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            FormOne(tableName: "bike_table")));
                              },
                              child: buildCategoryCard(
                                  Icons.motorcycle, 'Motorcycle        '),
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            FormOne(tableName: "bike_table")));
                              },
                              child: buildCategoryCard(
                                  Icons.electric_scooter, 'Scooters         '),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            FormOne(tableName: "car_table")));
                              },
                              child: buildCategoryCard(
                                  Icons.electric_car, 'Electric cars   '),
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            FormOne(tableName: "ebike_table")));
                              },
                              child: buildCategoryCard(
                                  Icons.electric_bike, 'Electric bikes  '),
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            FormOne(tableName: "escooter_table")));
                              },
                              child: buildCategoryCard(
                                  Icons.battery_charging_full, 'Electric scooter'),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 26,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.info_outline,
                              color: colorWhite.withOpacity(0.75),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text("Rating Guide",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: "MontserratRegular",
                                  fontSize: 12,
                                  color: colorWhite.withOpacity(0.75),
                                )),
                          ],
                        )
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCategoryCard(IconData icon, String label) {
    return Column(
      children: [
        Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: colorWhite.withOpacity(0.75), width: 1),
            color: Color(0xff2b2f3c),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 50, color: colorWhite.withOpacity(0.75)),
              ],
            ),
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: colorWhite.withOpacity(0.75),
            fontFamily: "MontserratRegular",
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
