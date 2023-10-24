import 'package:flutter/foundation.dart';

class Authenticator with ChangeNotifier {
  bool _isLoggedIn = false;
  String? _token;

  bool get isLoggedIn => _isLoggedIn;
  String? get token => _token;

  void login(String token) {
    _isLoggedIn = true;
    _token = token;
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    _token = null;
    notifyListeners();
  }
}
