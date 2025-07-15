import 'package:flutter/material.dart';

class RegisterProvider with ChangeNotifier {
  String _email = '';
  String _name = '';
  String _password = '';
  String _passwordConfirm = '';

  String get email => _email;
  String get name => _name;
  String get password => _password;
  String get passwordConfirm => _passwordConfirm;

  // TODO: validator 필요
  bool get isValid =>
      _email.isNotEmpty &&
      _name.isNotEmpty &&
      _password.isNotEmpty &&
      _passwordConfirm.isNotEmpty;

  void updateEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void updateName(String value) {
    _name = value;
    notifyListeners();
  }

  void updatePassword(String value) {
    _password = value;
    notifyListeners();
  }

  void updatePasswordConfirm(String value) {
    _passwordConfirm = value;
    notifyListeners();
  }
}
