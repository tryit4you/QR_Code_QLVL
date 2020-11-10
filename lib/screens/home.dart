import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../actions/scan.dart';
//import 'package:cupertino_icons/cupertino_icons.dart';

class HomeScreens extends StatefulWidget {
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
              label: 'Trang chủ',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.scanner_outlined),
              label: 'Quét mã',
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Danh sách',
              backgroundColor: Colors.cyan),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: 'Tài khoản',
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

