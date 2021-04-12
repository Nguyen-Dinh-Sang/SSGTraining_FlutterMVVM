import 'dart:developer';

import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  int _counter = 10;

  int get counter => _counter;

  void incrementCounter() async {
    setBusy(true);
    _counter++;
    await Future.delayed(Duration(seconds: 3), () => log('wait 3s'));
    setBusy(false);
    notifyListeners();
  }
}
