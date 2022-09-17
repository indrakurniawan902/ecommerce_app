import 'dart:async';

import 'dart:convert' as convert;
import 'package:ecommerce_app/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce_app/models/product.dart';

class ProductServices {
  Future<List<Product>?> getallproducts() async {
    try {
      var response = await http
          .get(Uri.parse(
              'http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'))
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException('connection time out please try again');
      });
      if (response.statusCode == 200) {
        List jsonresponse = convert.jsonDecode(response.body);
        return jsonresponse.map((e) => new Product.fromJson(e)).toList();
      } else {
        return null;
      }
    } on TimeoutException catch (_) {
      print('Response Time Out');
    }
  }
}
