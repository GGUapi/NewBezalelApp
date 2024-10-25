import 'package:flutter/foundation.dart';

class EmailProvider extends ChangeNotifier {
  String _email = '';

  String get email => _email;

  void setEmail(String newEmail) {
    _email = newEmail;
    notifyListeners();
  }
}
