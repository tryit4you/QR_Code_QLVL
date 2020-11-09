import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class ScanAction extends StatefulWidget {
  @override
  _ScanActionState createState() => _ScanActionState();
}

class _ScanActionState extends State<ScanAction> {
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
              child: ListView(
                physics: ClampingScrollPhysics(),
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Container(
                      child: Image.asset('assets/images/images_dien_luc.jpg',height: 150,),
                      
                    ),
                    
                  ),
                  SizedBox(height: 10,),
                  Container(child: Center(child: Text('Test'),),),

                  Container(
                    child: Row(
                      children: [
                        FlatButton(
                          child: Text('Sync data'),
                          onPressed: (){

                          },
                        ),
                        FlatButton(
                          child: Text('Scan QR'),
                          onPressed: (){
                            _scan(); 
                          },
                        )
                      ],
                    ),
                  )
                ],
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
