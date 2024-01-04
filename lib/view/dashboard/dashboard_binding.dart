import 'package:get/get.dart';
import 'package:my_ui/controller/dashboard_controller.dart';

import '../../controller/home_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
    Get.put(HomeController());
  }
}
