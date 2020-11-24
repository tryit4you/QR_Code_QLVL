import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonWidget {
  static final onLoading = loading;
}

final loading = Row(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  textDirection: TextDirection.ltr,
  children: <Widget>[
    CircularProgressIndicator(),
    Text(" Authenticating ... Please wait")
  ],
);
