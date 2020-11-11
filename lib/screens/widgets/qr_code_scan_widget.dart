import 'package:flutter/material.dart';
import 'package:qr_code_quanlyvattu/const/qr_scan_const.dart';
import 'package:qr_code_quanlyvattu/plugins/qr_scan/qr_code_scanner.dart';
class QRViewCode extends StatefulWidget {
  const QRViewCode({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewCodeState();
}

class _QRViewCodeState extends State<QRViewCode> {
  var qrText = '';
  var flashState = flashOn;
  var cameraState = frontCamera;
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0,title: Text('Quét mã QR',style: TextStyle(color: Colors.white),),backgroundColor: Color.fromRGBO( 0,0,0,0.5),),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.blue,
                borderRadius: 0,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: 300,
              ),
            ),
          ),
          Container(
              
                      child: Expanded(
              flex: 1,
              child: FittedBox(
                  
                fit: BoxFit.contain,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(' $qrText'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(8),
                          child: RaisedButton(
                            onPressed: () {
                              if (controller != null) {
                                controller.toggleFlash();
                                if (_isFlashOn(flashState)) {
                                  setState(() {
                                    flashState = flashOff;
                                  });
                                } else {
                                  setState(() {
                                    flashState = flashOn;
                                  });
                                }
                              }
                            },
                            child:
                                Text(flashState, style: TextStyle(fontSize: 20)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(8),
                          child: RaisedButton(
                            onPressed: () {
                              if (controller != null) {
                                controller.flipCamera();
                                if (_isBackCamera(cameraState)) {
                                  setState(() {
                                    cameraState = frontCamera;
                                  });
                                } else {
                                  setState(() {
                                    cameraState = backCamera;
                                  });
                                }
                              }
                            },
                            child:
                                Text(cameraState, style: TextStyle(fontSize: 20)),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(8),
                          child: RaisedButton(
                            onPressed: () {
                              controller?.pauseCamera();
                            },
                            child: Text('pause', style: TextStyle(fontSize: 20)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(8),
                          child: RaisedButton(
                            onPressed: () {
                              controller?.resumeCamera();
                            },
                            child: Text('resume', style: TextStyle(fontSize: 20)),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  bool _isFlashOn(String current) {
    return flashOn == current;
  }

  bool _isBackCamera(String current) {
    return backCamera == current;
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
