import 'package:flutter/material.dart';
import 'package:ridobike/Utils/colors.dart';

class DashboardItems extends StatelessWidget {
  final image;
  final title;
  const DashboardItems({super.key, this.title, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade100, borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width * .45,
                  height: 160,
                )),
            SizedBox(
              height: 8,
            ),
            Text(
             title,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: "MontserratSemiBold",
                  color: colorBlack),
            ),
          ],
        ),
      ),
    );
  }
}
