import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class ScanAction extends StatefulWidget {
  @override
  _ScanActionState createState() => _ScanActionState();
}

class _ScanActionState extends State<ScanAction> {
  String qrCodeResult = "Not Yet Scanned";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Center(
                child: Text('Quét mã vật tư'),
              ),
              decoration: BoxDecoration(
               color: 
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future _scan() async {
  String barcode = await scanner.scan();
  if (barcode == null) {
    //print('nothing return.');
  } else {
    //this._outputController.text = barcode;
  }
}
void main(List<String> args) {
  var list=['apple','banana','bơ'];
  list.forEach((item) {
    print(item);
  });
}