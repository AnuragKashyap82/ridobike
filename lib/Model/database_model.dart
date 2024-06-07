class DataBaseModel {
  String category;
  String make;
  String model;
  String year;
  String trim;
  String minPrice;
  String maxPrice;

  DataBaseModel({
    required this.category,
    required this.make,
    required this.model,
    required this.year,
    required this.trim,
    required this.minPrice,
    required this.maxPrice,
  });

  // Static method to create an instance with empty values
  static DataBaseModel empty() => DataBaseModel(
    category: '',
    make: '',
    model: '',
    year: '',
    trim: '',
    minPrice: '',
    maxPrice: '',
  );

  // Method to convert the object to a Map
  Map<String, dynamic> toJson() {
    return {
      'Category': category,
      'Make': make,
      'Model': model,
      'Year': year,
      'Trim': trim,
      'Min Price': minPrice,
      'Max Price': maxPrice,
    };
  }

  // Factory method to create an instance from a JSON map
  factory DataBaseModel.fromJson(Map<String, dynamic> data) {
    return DataBaseModel(
      category: data['Category'] ?? '',
      make: data['Make'] ?? '',
      model: data['Model'] ?? '',
      year: data['Year'] ?? '',
      trim: data['Trim'] ?? '',
      minPrice: data['Min Price'] ?? '',
      maxPrice: data['Max Price'] ?? '',
    );
  }
}
