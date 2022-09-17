import 'package:ecommerce_app/controller/product_controller.dart';
import 'package:ecommerce_app/main.dart';
import 'package:ecommerce_app/view/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app/view/product_tile.dart';
import 'package:ecommerce_app/view/detail_screen.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductController());
    final ProductController productController = Get.put(ProductController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.person_pin),
                      iconSize: 30,
                    ),
                    const Text(
                      'Shop.me',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add_shopping_cart),
                      iconSize: 30,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Column(
                children: [
                  const Text(
                    'Popular Product',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Obx(
                    () {
                      return controller.postloading.value
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : GridView.builder(
                              itemCount: productController.productList.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 16,
                                crossAxisSpacing: 16,
                                childAspectRatio: 0.53,
                              ),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  child: ProductTile(
                                      controller.productList[index]),
                                  onTap: () {
                                    Get.to(DetailScreen(
                                        controller.productList[index]));
                                  },
                                );
                              });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
