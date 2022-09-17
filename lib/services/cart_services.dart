import 'dart:async';
import 'dart:convert';
import 'package:ecommerce_app/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce_app/models/product.dart';

class CartServices {
  var url = "https://fakestoreapi.com/carts/1";
  var purl = "https://fakestoreapi.com/products/";

  loadCartFromApi() async {
    var response = await http.get(Uri.parse(url));
    var productsJson = json.decode(response.body);
    return productsJson["products"];
  }

  Future getProductFromApi(productId) async {
    var response = await http.get(Uri.parse(purl + productId.toString()));
    return json.decode(response.body);
  }
}
