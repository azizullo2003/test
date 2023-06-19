import 'package:flutter/material.dart';

class NavigationProvider with ChangeNotifier {
  String _currentNavigation = "home";
  String get currentNavigation => _currentNavigation;

  void changeNavigation(String navigation) {
    _currentNavigation = navigation;
    notifyListeners();
  }
}
