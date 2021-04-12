import 'package:flutter/material.dart';
import 'package:flutter_mvvm/list_product/view/ProductView.dart';
import 'package:flutter_mvvm/login/LoginView.dart';
import 'package:flutter_mvvm/stacked/view/HomeView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeView(title: 'Stacked',),
    );
  }
}