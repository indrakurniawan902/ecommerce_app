import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/controller/product_controller.dart';
import 'package:ecommerce_app/services/product_services.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController instance = Get.find();
  var productList = <Product>[].obs;
  ProductServices services = ProductServices();
  var postloading = true.obs;
  @override
  void onInit() {
    callpostmethod();
    super.onInit();
  }

  callpostmethod() async {
    try {
      postloading.value = true;
      var result = await services.getallproducts();
      if (result != null) {
        productList.assignAll(result);
      } else {
        print('Null');
      }
    } finally {
      postloading.value = false;
    }
    update();
  }
}
