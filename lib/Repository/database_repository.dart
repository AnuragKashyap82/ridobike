import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ridobike/Model/database_model.dart';


class DatabaseRepository extends GetxController {
  static DatabaseRepository get instance => Get.find();

  Future<List<DataBaseModel>> getAllvehicle(String make, String model, String year, String trim, String tableName) async {
    try {
      final response = await http.get(
        Uri.parse('http://192.168.1.24/api/index.php?table=$tableName&make=$make&model=$model&year=$year&trim=$trim'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> vehicleData = json.decode(response.body);
        final List<DataBaseModel> vehicle = vehicleData
            .map((materialData) => DataBaseModel.fromJson(materialData))
            .toList();

        return vehicle;
      } else {
        throw "Failed to load vehicle: ${response.statusCode}";
      }
    } catch (e) {
      throw "Something went wrong: $e";
    }
  }


  Future<List<dynamic>> getAllMakes(String tableName) async {
    try {
      final response = await http.get(
        Uri.parse('http://192.168.1.24/api/index.php?action=getMakes&table=$tableName'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> makes = json.decode(response.body);
        return makes;
      } else {
        throw "Failed to load makes: ${response.statusCode}";
      }
    } catch (e) {
      throw "Something went wrong: $e";
    }
  }

  Future<List<dynamic>> getAllModel(String tableName, String brand) async {
    print("object");
    try {
      final response = await http.get(
        Uri.parse('http://192.168.1.24/api/index.php?table=$tableName&make=$brand'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> models = json.decode(response.body);
        return models;
      } else {
        throw "Failed to load makes: ${response.statusCode}";
      }
    } catch (e) {
      throw "Something went wrong: $e";
    }
  }

  Future<List<dynamic>> getAllYears(String tableName, String brand, String model) async {
    try {
      final response = await http.get(
        Uri.parse('http://192.168.1.24/api/index.php?table=$tableName&make=$brand&model=$model'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> models = json.decode(response.body);
        return models;
      } else {
        throw "Failed to load makes: ${response.statusCode}";
      }
    } catch (e) {
      throw "Something went wrong: $e";
    }
  }

  Future<List<dynamic>> getAllTrim(String tableName, String brand, String model, String year) async {
    try {
      final response = await http.get(
        Uri.parse('http://192.168.1.24/api/index.php?make=$brand&model=$model&table=$tableName&year=$year'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> models = json.decode(response.body);
        return models;
      } else {
        throw "Failed to load makes: ${response.statusCode}";
      }
    } catch (e) {
      throw "Something went wrong: $e";
    }
  }

  Future<List<dynamic>> getAllNewCarsData(String carName) async {
    try {
      final response = await http.get(

        Uri.parse('http://192.168.1.24/api/index.php?table=newcars_table&carName=$carName'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> models = json.decode(response.body);
        return models;
      } else {
        throw "Failed to load makes: ${response.statusCode}";
      }
    } catch (e) {
      throw "Something went wrong: $e";
    }
  }
}
