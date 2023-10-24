import 'package:flutter/foundation.dart';

class UserProfile with ChangeNotifier {
  late String _username;
  late String _email;

  String get username => _username;
  String get email => _email;

  void updateProfile(String username, String email) {
    _username = username;
    _email = email;
    notifyListeners();
  }
}
