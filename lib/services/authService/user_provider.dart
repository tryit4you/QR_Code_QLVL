import 'package:flutter/cupertino.dart';
import 'package:qr_code_quanlyvattu/models/user_model.dart';

class UserProvider with ChangeNotifier {
  UserModel _user = UserModel();
  UserModel get user => _user;

  void setUser(UserModel user) {
    _user = user;
    notifyListeners();
  }
}
