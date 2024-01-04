import 'dart:convert';

List<ProductCategory> productCategoryFromMap(String str) =>
    List<ProductCategory>.from(
        json.decode(str).map((x) => ProductCategory.fromJson(x)));

class ProductCategory {
  final String name;

  ProductCategory(this.name);

  factory ProductCategory.fromJson(Map<String, dynamic> json) {
    return ProductCategory(json['name']);
  }

  Map<String, dynamic> toJson() {
    return {'name': name};
  }
}
