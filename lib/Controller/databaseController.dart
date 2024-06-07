import 'package:get/get.dart';
import 'package:ridobike/Model/database_model.dart';
import 'package:ridobike/Repository/database_repository.dart';

class DataBaseController extends GetxController {
  static DataBaseController get instance => Get.find();

  final isLoading = false.obs;
  final _databaseRepository = Get.put(DatabaseRepository()); // Adjust repository reference
  RxList<DataBaseModel> allvehicle = <DataBaseModel>[].obs;

  RxList<dynamic> allMakes = <dynamic>[].obs;
  RxList<dynamic> allModels = <dynamic>[].obs;
  RxList<dynamic> allYears = <dynamic>[].obs;
  RxList<dynamic> allTrims = <dynamic>[].obs;

  RxList<dynamic> searchMakes = <dynamic>[].obs;
  RxList<dynamic> searchModels = <dynamic>[].obs;
  RxList<dynamic> searchYears = <dynamic>[].obs;
  RxList<dynamic> searchTrim = <dynamic>[].obs;

  RxList<dynamic> allNewCarVariant = <dynamic>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> fetchData(String make, String model, String year, String trim, String tableName) async {
    try {
      isLoading.value = true;
      final vehicle = await _databaseRepository.getAllvehicle(make, model, year, trim, tableName); // Adjust repository method

      allvehicle.assignAll(vehicle);
      isLoading.value = false;


    } catch (e) {
      print(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
  Future<void> fetchMake(String tableName) async {
    try {
      isLoading.value = true;
      final vehicle = await _databaseRepository.getAllMakes(tableName); // Adjust repository method

      allMakes.assignAll(vehicle);
      isLoading.value = false;

    } catch (e) {
      print(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchModels(String tableName, String brand) async {
    try {
      isLoading.value = true;
      final vehicle = await _databaseRepository.getAllModel(tableName, brand); // Adjust repository method

      allModels.assignAll(vehicle);
      isLoading.value = false;

    } catch (e) {
      print(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchYears(String tableName, String brand, String model) async {
    try {
      isLoading.value = true;
      final vehicle = await _databaseRepository.getAllYears(tableName, brand, model); // Adjust repository method

      allYears.assignAll(vehicle);
      isLoading.value = false;

    } catch (e) {
      print(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchTrim(String tableName, String brand, String model, String year) async {
    try {
      isLoading.value = true;
      final vehicle = await _databaseRepository.getAllTrim(tableName, brand, model, year); // Adjust repository method

      allTrims.assignAll(vehicle);
      isLoading.value = false;

    } catch (e) {
      print(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchVariantForNewCra(String carName) async {
    try {
      isLoading.value = true;
      final vehicle = await _databaseRepository.getAllNewCarsData(carName); // Adjust repository method
      allNewCarVariant.assignAll(vehicle);
      isLoading.value = false;

    } catch (e) {
      print(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void searchBrand(String searchText) {
    if (searchText.isEmpty) {
      // If search text is empty, clear the searchMakes list
      searchMakes.clear();
    } else {
      searchMakes.clear();
      // Perform a local search in the existing allMakes list
      searchMakes.assignAll(allMakes.where((make) =>
          make.toLowerCase().contains(searchText.toLowerCase())).toList());
    }
  }

  void searchModel(String searchText) {
    if (searchText.isEmpty) {
      // If search text is empty, clear the searchMakes list
      searchModels.clear();
    } else {
      searchModels.clear();
      // Perform a local search in the existing allMakes list
      searchModels.assignAll(allModels.where((make) =>
          make.toLowerCase().contains(searchText.toLowerCase())).toList());
    }
  }

  void searchYear(String searchText) {
    if (searchText.isEmpty) {
      // If search text is empty, clear the searchMakes list
      searchYears.clear();
    } else {
      searchYears.clear();
      // Perform a local search in the existing allMakes list
      searchYears.assignAll(allYears.where((make) =>
          make.toLowerCase().contains(searchText.toLowerCase())).toList());
    }
  }

  void searchVariant(String searchText) {
    if (searchText.isEmpty) {
      // If search text is empty, clear the searchMakes list
      searchTrim.clear();
    } else {
      searchTrim.clear();
      // Perform a local search in the existing allMakes list
      searchTrim.assignAll(allTrims.where((make) =>
          make.toLowerCase().contains(searchText.toLowerCase())).toList());
    }
  }

}
