class QrCode {
  String id;
  String image;
  String name;
  DateTime scanTime;
  bool state;
  String scanBy;
  QrCode(
      this.id, this.image, this.name, this.scanTime, this.state, this.scanBy);
}

//test data
List<QrCode> qrcodes = qrcodetemp
    .map((e) => QrCode(
        e['id'], e['image'], e['name'], e['scanTime'], e['state'], e['scanBy']))
    .toList();
var qrcodetemp = [
  {
    'id': '1001',
    'image': 'assets/images/qrcode.jpg',
    'name': 'PD01001',
    'scanTime': DateTime.now(),
    'state': true,
    'scanBy': 'abc'
  },
  {
    'id': '1001',
    'image': 'assets/images/qrcode.png',
    'name': 'PD01001',
    'scanTime': DateTime.now(),
    'state': true,
    'scanBy': 'abc'
  },
  {
    'id': '1002',
    'image': 'assets/images/qrcode.png',
    'name': 'PD01001',
    'scanTime': DateTime.now(),
    'state': true,
    'scanBy': 'abc'
  },
  {
    'id': '1002',
    'image': 'assets/images/qrcode.png',
    'name': 'PD01001',
    'scanTime': DateTime.now(),
    'state': true,
    'scanBy': 'abc'
  },
];
