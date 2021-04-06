import 'package:flutter_mvvm/list_product/model/ProductModel.dart';

abstract class ProductRepo {

  Future<List<Product>> searchProduct(String key);

}