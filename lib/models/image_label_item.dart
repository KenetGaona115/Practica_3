import 'package:flutter/foundation.dart';

class ImageLabelItem {
  final double similitud;
  final String identificador;
  final String texto;
  final String imagenBase64;

  ImageLabelItem({
    @required this.imagenBase64,
    @required this.similitud,
    @required this.identificador,
    @required this.texto,
  });
}
