import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
