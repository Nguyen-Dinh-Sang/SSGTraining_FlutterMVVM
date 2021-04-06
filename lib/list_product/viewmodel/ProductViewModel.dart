import 'package:flutter_mvvm/list_product/model/ProductModel.dart';
import 'package:flutter_mvvm/list_product/model/ProductRepo.dart';
import 'package:flutter_mvvm/list_product/model/ProductRepoImpl.dart';
import 'package:flutter_mvvm/list_product/view/BaseView.dart';

import 'BaseViewModel.dart';

class ProductViewModel extends BaseViewModel {
  ProductRepo productRepo = ProductRepoIml();
  List<Product> listProduct = <Product>[];
  bool isLoading = false;

  ProductViewModel(BaseView view) : super(view);

  void searchProduct(String key) async {
    isLoading = true;
    notifyDataChanged();
    listProduct = await productRepo.searchProduct(key);
    isLoading = false;
    notifyDataChanged();
  }
}
