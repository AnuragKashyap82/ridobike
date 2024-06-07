import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ridobike/Model/database_model.dart';
import 'package:ridobike/Utils/colors.dart';

class ContainerSelection extends StatefulWidget {
  final DataBaseModel carData;

  const ContainerSelection({super.key, required this.carData});

  @override
  _ContainerSelectionState createState() => _ContainerSelectionState();
}

class _ContainerSelectionState extends State<ContainerSelection> {
  int selectedContainerIndex = 2;
  final NumberFormat formatter = NumberFormat('#,##,###');
  late String goodMinPrice;
  late String goodMaxPrice;

  late double badMinPrice;
  late double badMaxPrice;

  late double fairMinPrice;
  late double fairMaxPrice;

  late double veryGoodMinPrice;
  late double veryGoodMaxPrice;

  late double excellentMinPrice;
  late double excellentMaxPrice;

  @override
  void initState() {
    super.initState();

    // Initialize the 'Good' prices
    goodMinPrice = widget.carData.minPrice ?? "0";
    goodMaxPrice = widget.carData.maxPrice ?? "0";

    // Extract numeric part using split
    // Parse price values as double
    double goodMinPriceValue = double.tryParse(goodMinPrice.split('Rs. ').last.replaceAll(',', '').trim()) ?? 0;
    double goodMaxPriceValue = double.tryParse(goodMaxPrice.split('Rs. ').last.replaceAll(',', '').trim()) ?? 0;
    print(goodMaxPriceValue);
    print(goodMinPriceValue);

    // Bad: 95% of Good
    badMinPrice = (goodMinPriceValue * 0.95);
    badMaxPrice = (goodMaxPriceValue * 0.95);

    // Fair: 97.5% of Good
    fairMinPrice = (goodMinPriceValue * 0.975);
    fairMaxPrice = (goodMaxPriceValue * 0.975);

    // Very Good: 102.5% of Good
    veryGoodMinPrice = (goodMinPriceValue * 1.025);
    veryGoodMaxPrice = (goodMaxPriceValue * 1.025);

    // Excellent: 105% of Good
    excellentMinPrice = (goodMinPriceValue * 1.05);
    excellentMaxPrice = (goodMaxPriceValue * 1.05);
  }

  void selectContainer(int index) {
    setState(() {
      selectedContainerIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    String priceRange;
    switch (selectedContainerIndex) {
      case 0:
        priceRange = "Rs. ${formatter.format(badMinPrice)} - Rs. ${formatter.format(badMaxPrice)}";
        break;
      case 1:
        priceRange = "Rs. ${formatter.format(fairMinPrice)} - Rs. ${formatter.format(fairMaxPrice)}";
        break;
      case 2:
        priceRange = "${goodMinPrice} - ${goodMinPrice}";
        break;
      case 3:
        priceRange = "Rs. ${formatter.format(veryGoodMinPrice)} - Rs. ${formatter.format(veryGoodMaxPrice)}";
        break;
      case 4:
        priceRange = "Rs. ${formatter.format(excellentMinPrice)} - Rs. ${formatter.format(excellentMaxPrice)}";
        break;
      default:
        priceRange = "Rs. ${formatter.format(goodMinPrice)} - Rs. ${formatter.format(goodMaxPrice)}";
        break;
    }


    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "$priceRange",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(5, (index) {
              return ContainerOption(
                index: index,
                isSelected: selectedContainerIndex == index,
                onSelect: selectContainer,
              );
            }),
          ),
        ),
      ],
    );
  }
}

class ContainerOption extends StatelessWidget {
  final int index;
  final bool isSelected;
  final Function(int) onSelect;

  const ContainerOption({
    required this.index,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final labels = ["Bad", "Fair", "Good", "Very Good", "Excellent"];
    return GestureDetector(
      onTap: () => onSelect(index),
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Container(
          height: 32,
          width: MediaQuery.of(context).size.width * 0.3 - 24,
          decoration: BoxDecoration(
            color: isSelected ? colorPrimary : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              labels[index],
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
