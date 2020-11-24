import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_quanlyvattu/models/user_model.dart';
import 'package:qr_code_quanlyvattu/screens/home.dart';
import 'package:qr_code_quanlyvattu/screens/login.dart';
import 'package:qr_code_quanlyvattu/screens/register.dart';
import 'package:qr_code_quanlyvattu/services/authService/auth_porvider.dart';
import 'package:qr_code_quanlyvattu/services/authService/user_provider.dart';
import 'package:qr_code_quanlyvattu/shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    home: QrScanApp(),
  ));
}

class QrScanApp extends StatefulWidget {
  _QrScanAppState createState() => _QrScanAppState();
}

class _QrScanAppState extends State<QrScanApp> {
  Future<UserModel> getUserData() => UserPreferences().getUser();
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthProvider()),
          ChangeNotifierProvider(create: (_) => UserProvider())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Qr_code_QLVT',
          home: FutureBuilder(
            future: getUserData(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return CircularProgressIndicator();
                default:
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.data.token == null) {
                    return LoginScreen();
                  } else {
                    UserPreferences().removeUser();
                  }
                  return HomeScreens(user: snapshot.data);
              }
            },
          ),
          routes: {
            '/login': (context) => LoginScreen(),
            '/register': (context) => RegisterScreen()
          },
          //  home: HomeScreens(),
        ));
  }
}
