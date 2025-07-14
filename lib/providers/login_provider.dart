import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  String _email = '';
  String _password = '';

  String get email => _email;
  String get password => _password;
  bool get isValid =>
      _email.isNotEmpty && _password.isNotEmpty; // TODO: validator 필요

  void updateEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void updatePassword(String value) {
    _password = value;
    notifyListeners();
  }
}
