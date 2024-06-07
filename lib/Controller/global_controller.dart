

import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class GlobalController extends GetxController {

  RxString brand = 'Brand'.obs;
  RxString model = 'Model'.obs;
  RxString variant = 'Variant'.obs;
  RxString year = 'Year'.obs;
  // RxString trim = 'Trim'.obs;


}
