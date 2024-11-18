import 'package:flutter/cupertino.dart';
import 'package:provider_product_api/service/apiservice.dart';

import '../model/Products.dart';

class ProductProvider with ChangeNotifier {
  List<Products>?plist = [];
  bool isloading = false;
  Apiservice apiservice = Apiservice();

  Future<void> fetch () async {
    Loading();
    plist = await apiservice.getAllProducts()??[];
    notifyListeners();
    Loading();
  }

  void Loading () {
    isloading = !isloading;
    notifyListeners();
  }
}