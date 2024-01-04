import 'package:get/get.dart';
import 'package:my_ui/model/category.dart';
import '../services/api_service/api_service_category.dart';

class CategoryController extends GetxController {
  static CategoryController instance = Get.find();
  RxList<ProductCategory> categoryList =
      List<ProductCategory>.empty(growable: true).obs;
  RxBool isCategoryLoading = false.obs;

  @override
  void onInit() {
    getCategory();
    super.onInit();
  }

  void getCategory() async {
    try {
      isCategoryLoading(true);
      var result = await CategoryService().get();
      if (result != null) {
        categoryList.assignAll(productCategoryFromMap(result.body));
      }
    } finally {
      print(categoryList);
      isCategoryLoading(false);
    }
  }
}
