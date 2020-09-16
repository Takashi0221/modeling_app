import 'package:flutter/material.dart';

class MainModel extends ChangeNotifier {
  int _selectedIndex = 0;
  get selectedIndex => _selectedIndex;
  set selectedIndex(value) {
    _selectedIndex = value;
    notifyListeners();
  }
}
