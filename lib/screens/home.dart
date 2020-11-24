import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_quanlyvattu/models/user_model.dart';

import '../actions/scan.dart';
//import 'package:cupertino_icons/cupertino_icons.dart';

class HomeScreens extends StatefulWidget {
  final UserModel user;
  HomeScreens({Key key, @required this.user}) : super(key: key);
  _HomeScreensState createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  var _currentIndex = 2;
  final tabs = [
    Center(
      child: Text('Trang chủ'),
    ),
    ScanAction(),
    Center(
      child: Text('Danh sách kiểm kê'),
    ),
    Center(
      child: Text('Tài khoản'),
    ),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.blue,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Trang chủ'),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.code),
              title: Text('Quét mã'),
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              title: Text('Danh sách'),
              backgroundColor: Colors.cyan),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              title: Text('Tài khoản'),
              backgroundColor: Colors.green)
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
