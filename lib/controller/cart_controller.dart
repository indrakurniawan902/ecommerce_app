import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/controller/product_controller.dart';
import 'package:ecommerce_app/services/cart_services.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  CartServices services = CartServices();
  var cartItems = [];
  var loading = false.obs;
  var subtotal = 0.0.obs;

  CartController() {
    loadCartFromApi();
  }
  loadCartFromApi() async {
    loading(true);
    var productsList = await services.loadCartFromApi();

    for (var i = 0; i < productsList.length; i++) {
      var product =
          await services.getProductFromApi(productsList[i]["productId"]);
      subtotal(subtotal.value + product["price"] * productsList[i]["quantity"]);
      cartItems
          .add({"product": product, "quantity": productsList[i]["quantity"]});
    }
    loading(false);
    update();
  }
}
