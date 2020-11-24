import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:qr_code_quanlyvattu/models/user_model.dart';
import 'package:qr_code_quanlyvattu/services/apiService/appUrl.dart';
import 'package:qr_code_quanlyvattu/services/authService/auth_status.dart';
import 'package:qr_code_quanlyvattu/shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  Status _loggedInStatus = Status.NotLogedIn;
  Status _registeredInStatus = Status.NotRegistered;

  Status get loggedInStatus => _loggedInStatus;
  Status get registeredInStatus => _registeredInStatus;

  Future<Map<String, dynamic>> login(String userName, String password) async {
    var result;
    final Map<String, dynamic> loginData = {
      'user': {'username': userName, 'password': password}
    };
    _loggedInStatus = Status.Authenticating;
    notifyListeners();
    Response response = await post(AppUrl.login,
        body: json.encode(loginData),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      var userData = responseData['data'];

      UserModel authUser = UserModel.fromJson(userData);

      UserPreferences().saveUser(authUser);
      _loggedInStatus = Status.LoggedIn;
      notifyListeners();
      result = {'status': true, 'message': 'Successful', 'user': authUser};
    } else {
      _loggedInStatus = Status.NotLogedIn;
      notifyListeners();
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }

  Future<Map<String, dynamic>> register(String username, String email,
      String password, String passwordConfirm) async {
    final Map<String, dynamic> registrationData = {
      'user': {
        'username': username,
        'email': email,
        'password': password,
        'password_confirm': passwordConfirm
      }
    };
    _registeredInStatus = Status.Registering;
    notifyListeners();
    return await post(AppUrl.register,
            body: json.encode(registrationData),
            headers: {'Content-Type': 'application/json'})
        .then(onValue)
        .catchError(onError);
  }

  static Future<FutureOr> onValue(Response response) async {
    var result;
    final Map<String, dynamic> responseData = json.decode(response.body);
    if (response.statusCode == 200) {
      var userData = responseData['data'];
      UserModel authUser = UserModel.fromJson(userData);

      UserPreferences().saveUser(authUser);

      result = {
        'status': true,
        'message': 'Đăng ký tài khoản thành công',
        'data': authUser
      };
    } else {
      result = {
        'status': false,
        'message': 'Đăng ký không thành công',
        'data': responseData
      };
    }
    return result;
  }

  static onError(error) {
    print('the error is $error.detail');
    return {
      'status': false,
      'message': 'Đăng ký không thành công',
      'data': error
    };
  }
}
