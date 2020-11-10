import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QrScannerOverlayShape extends ShapeBorder {
  QrScannerOverlayShape(
      {this.borderColor = Colors.red,
      this.borderWidth = 3.0,
      this.overlayColor = const Color.fromRGBO(0, 0, 0, 80),
      this.borderRadius = 0,
      this.borderLength = 40,
      this.cutOutSize = 250});
  final Color borderColor;
  final double borderWidth;
  final Color overlayColor;
  final double borderRadius;
  final double borderLength;
  final double cutOutSize;
  @override
  EdgeInsetsGeometry get dimensions => const EdgeInsets.all(10);
  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    return Path()
      ..fillType = PathFillType.evenOdd
      ..addPath(getOuterPath(rect), Offset.zero);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    Path _getLeftTopPath(Rect rect) {
      return Path()
        ..moveTo(rect.left, rect.bottom)
        ..lineTo(rect.left, rect.top)
        ..lineTo(rect.right, rect.top);
    }

    return _getLeftTopPath(rect)
      ..lineTo(
        rect.right,
        rect.bottom,
      )
      ..lineTo(
        rect.left,
        rect.bottom,
      )
      ..lineTo(
        rect.left,
        rect.top,
      );
  }
}
