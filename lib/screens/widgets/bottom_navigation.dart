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
              title: Text('Trang chủ'),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.check),
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