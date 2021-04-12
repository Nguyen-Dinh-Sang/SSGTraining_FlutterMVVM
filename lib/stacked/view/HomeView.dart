import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mvvm/stacked/viewmodel/HomeViewModel.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  HomeView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    log('HomeView rebuild');
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        onModelReady: (model) => null,
        builder: (context, model, child) {
          return Scaffold(

            appBar: AppBar(
              title: Text(title),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '${model.isBusy ? 'Loading' : model.counter}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => model.incrementCounter(),
              child: Icon(Icons.add),
            ),
          );
        });
  }
}
