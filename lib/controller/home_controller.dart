import 'package:get/get.dart';
import 'package:my_ui/model/product.dart';
import 'package:my_ui/services/api_service/api_service_product.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  RxList<Product> productList = List<Product>.empty(growable: true).obs;
  RxBool isProductLoading = false.obs;

  @override
  void onInit() {
    getProduct();
    super.onInit();
  }

  void getProduct() async {
    try {
      isProductLoading(true);
      var result = await ProductService().get();
      if (result != null) {
        productList.assignAll(productFromMap(result.body));
      }
    } finally {
      isProductLoading(false);
    }
  }
}
