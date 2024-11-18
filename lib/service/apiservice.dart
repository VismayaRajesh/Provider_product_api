import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:provider_product_api/model/Products.dart';
import 'package:provider_product_api/model/RespProduct.dart';
class Apiservice {
  final baseurl = 'https://dummyjson.com';

  Future<List<Products>?> getAllProducts() async {
    var response = await http.get(Uri.parse("$baseurl/products"));
    if(response.statusCode >= 200 && response.statusCode <= 299){
      var jsonn = jsonDecode(response.body);
      var res = RespProduct.fromJson(jsonn);
      var list = res.products;
      return list;
    }
  }
}