import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_quanlyvattu/actions/generate.dart';
import 'package:qr_code_quanlyvattu/actions/scan.dart';
//import 'package:cupertino_icons/cupertino_icons.dart';

class HomeScreens extends StatefulWidget {
  _HomeScreensState createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  //  Container(
  //       height: MediaQuery.of(context).size.height,
  //       width: MediaQuery.of(context).size.width,
  //       padding: EdgeInsets.all(20.0),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         crossAxisAlignment: CrossAxisAlignment.stretch,
  //         children: [
  //           Image(
  //               image: NetworkImage(
  //                   "https://media.istockphoto.com/vectors/qr-code-scan-phone-icon-in-comic-style-scanner-in-smartphone-vector-vector-id1166145556")),
  //           flatButton("Scan QR CODE", ScanAction()),
  //           SizedBox(
  //             height: 20,
  //           ),
  //           flatButton("Generate QR CODE", GenerateAction()),
  //         ],
  //       ),
  //     ),
  //     ,
  var _currentIndex = 2;
  final tabs = [
    Center(
      child: Text('Trang chủ'),
    ),
    Center(child: ScanAction()),
    Center(
      child: Text('Danh sách kiểm kê'),
    ),
    Center(
      child: Text('Tài khoản'),
    ),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trang chủ'),
        centerTitle: true,
      ),
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
