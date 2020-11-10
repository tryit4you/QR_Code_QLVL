import 'package:flutter/material.dart';
class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.blue,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Trang chủ',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.check),
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