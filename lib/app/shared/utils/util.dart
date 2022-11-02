import 'package:flutter/material.dart';

class Util {
  double getSizeValue(SIZE size) {
    if (size == SIZE.small) return 400;
    if (size == SIZE.medium) return 720;
    if (size == SIZE.large) return 920;
    return 720;
  }

  double getadaptiveText(context, {required double fontsize}) =>
      _calcAdaptive(context, fontsize);

  double getadptiveComponents(context, {required double size}) =>
      _calcAdaptive(context, size);

  double getAdaptiveIcon(context, {required double size}) =>
      _calcAdaptive(context, size + 2);

  double _calcAdaptive(context, double value) {
    double heigth = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double media = (heigth + width) / 2;
    return (media * 0.0017) * value;
  }
}

enum SIZE {
  small,
  medium,
  large,
}
