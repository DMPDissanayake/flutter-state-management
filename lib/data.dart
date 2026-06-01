import 'package:flutter/material.dart';

class Data extends InheritedWidget {
  String name = 'DMP Dissnayake';

  Data({required super.child});

  static Data? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Data>();
  }

  @override
  bool updateShouldNotify(Data oldWidget) {
    return name != oldWidget.name;
  }
}
