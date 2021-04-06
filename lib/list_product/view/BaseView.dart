import 'package:flutter/material.dart';

abstract class BaseView extends State {
  void update() {
    setState(() {
      //khi gọi thì view tự update
    });
  }
}
