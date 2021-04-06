import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mvvm/list_product/model/ProductModel.dart';
import 'package:flutter_mvvm/list_product/viewmodel/ProductViewModel.dart';

import 'BaseView.dart';

class ProductView extends StatefulWidget {
  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends BaseView {
  ProductViewModel productViewModel;
  TextEditingController searchController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productViewModel = ProductViewModel(this);
    productViewModel.searchProduct('');

    searchController.addListener(() {
      productViewModel.searchProduct(searchController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List'),
        ),
        body: Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                  labelText: 'Search', prefixIcon: Icon(Icons.search)),
            ),
          ),
          Expanded(
            child: ListView.builder(
                      itemCount: productViewModel.listProduct.length,
                      itemBuilder: (context, index) {
                        return buildListTile(productViewModel.listProduct[index], index);
                      }),
          )
        ]));
  }

  ListTile buildListTile(Product product, int index) {
    return ListTile(
      title: Container(
        padding: EdgeInsets.all(10.0),
        color: Colors.pink[50],
        child: Align(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Index: ' + index.toString(),
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Name: ' + product.productName,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Type: ' + product.productType,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Total: ' + product.totalProduct.toString(),
                  style: TextStyle(fontSize: 16.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
