import 'dart:ui';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/foundation.dart';

class BarcodeItem {
  final String codigo;
  final String tipoCodigo;
  final String tituloUrl;
  final BarcodeURLBookmark url;
  final Rect areaDeCodigo;
  final List<Offset> puntosEsquinas;
  final String imagenBase64;

  BarcodeItem({
    @required this.imagenBase64,
    @required this.codigo,
    @required this.tipoCodigo,
    @required this.tituloUrl,
    @required this.url,
    @required this.areaDeCodigo,
    @required this.puntosEsquinas,
  });
}
