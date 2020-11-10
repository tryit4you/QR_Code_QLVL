import 'package:flutter/material.dart';
import 'package:qr_code_quanlyvattu/const/colors_const.dart';
import 'package:qr_code_quanlyvattu/const/textstyle_const.dart';
import 'package:qr_code_quanlyvattu/models/qr_code.dart';
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
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Container(
                child: Image.asset(
                  'assets/images/images_dien_luc.jpg',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Các mã đã quét',
                          style: titleStyle,
                        ),
                        Text('Tất cả', style: moreStyle)
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        height: 70,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: qrcodes.length,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              child: Container(
                                height: 50,
                                width: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: borderColor,width:1)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        height: 70,
                                        width: 70,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  qrcodes[index].image),
                                              fit: BoxFit.contain),
                                        )),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          qrcodes[index].name,
                                          style: titleStyle,
                                        ),
                                        Text(
                                          qrcodes[index].scanBy.toString(),
                                          style: subtitleStyle,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ))
                ],
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FlatButton(
                      child: Text('Sync data',style: TextStyle(color: Colors.white),),
                      color: Colors.blue,
                      onPressed: () {},
                    ),
                    FlatButton(
                      child: Text('Scan QR',style: TextStyle(color: Colors.white),),
                      color: Colors.blue,
                      onPressed: () {
                        _scan();
                      },
                    )
                  ],
                ),
              ),
            )
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
