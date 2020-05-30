import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetFactory {
  Widget create(Widget child) {
    return MaterialApp(
      home: Scaffold(
        body: child,
      ),
    );
  }
}
