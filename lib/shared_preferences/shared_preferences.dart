import 'package:qr_code_quanlyvattu/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  Future<bool> saveUser(UserModel user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userId', user.userid);
    prefs.setString("username", user.username);
    prefs.setString("email", user.email);
    prefs.setString("phone", user.phoneNumber);
    prefs.setString("type", user.type);
    prefs.setString("token", user.token);
    prefs.setString("renewalToken", user.renewalToken);
    return await prefs.commit();
  }

  Future<UserModel> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return UserModel(
        avatarUrl: null,
        birthday: null,
        email: prefs.get('email'),
        phoneNumber: prefs.get('phone'),
        token: prefs.get('token'),
        userid: prefs.get('userId'),
        renewalToken: prefs.get('renewalToken'),
        type: prefs.get('type'),
        username: prefs.get('username'));
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('username');
    prefs.remove('email');
    prefs.remove('phone');
    prefs.remove('userId');
    prefs.remove('renewalToken');
    prefs.remove('type');
  }

  Future<String> getToken(args) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.get('token');
    return token;
  }
}
