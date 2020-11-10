import 'package:flutter/material.dart';
import 'package:qr_code_quanlyvattu/screens/home.dart';

void main() {
  runApp(MaterialApp(
    home: QrScanApp(),
  ));
}

class QrScanApp extends StatefulWidget {
  _QrScanAppState createState() => _QrScanAppState();
}

class _QrScanAppState extends State<QrScanApp> {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Qr_code_QLVT',
      home: HomeScreens(),
    );
  }
}
