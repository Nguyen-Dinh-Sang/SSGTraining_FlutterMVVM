import 'package:flutter_mvvm/list_product/view/BaseView.dart';

abstract class BaseViewModel {
  BaseView view;

  BaseViewModel(this.view);

  void notifyDataChanged() {
    view.update();
  }
}