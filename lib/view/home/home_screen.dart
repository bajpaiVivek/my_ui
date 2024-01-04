import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ui/component/main_header.dart';
import 'package:my_ui/controller/controllers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: [
        const MainHeader(),
        Obx(() {
          if (homeController.isProductLoading.value) {
            return const CircularProgressIndicator();
          } else {
            return Expanded(
              child: ListView.builder(
                itemCount: homeController.productList.length,
                itemBuilder: (context, index) {
                  var product = homeController.productList[index];
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 5, left: 15, right: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: NetworkImage(product.image),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.title,
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('Price: \$${product.price}'),
                              Text(
                                'Description: ${product.description}',
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text('${product.category}'),
                              Padding(
                                padding: EdgeInsets.zero,
                                child: Column(
                                  children: [
                                    Text('Ratings: ${product.rating.rate}'),
                                    Text('${product.rating.count} ratings'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }
        }),
      ]),
    );
  }
}
