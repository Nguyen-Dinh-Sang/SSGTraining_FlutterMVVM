import 'package:flutter_mvvm/list_product/model/ProductAPI.dart';
import 'package:flutter_mvvm/list_product/model/ProductModel.dart';
import 'package:flutter_mvvm/list_product/model/ProductRepo.dart';

class ProductRepoIml extends ProductRepo {
  final productAPI = ProductAPI();

  @override
  Future<List<Product>> searchProduct(String key) async{
    return await productAPI.searchData(key);
  }

}