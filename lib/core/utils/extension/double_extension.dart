import 'package:flutter/material.dart';
import 'package:mostafamorsy/core/utils/app_size/app_size.dart';

extension DoublNullExtension on double? {
  double get validate => this ?? 0;
  double get h => getVerticalSize(validate);
  double get w => getHorizontalSize(validate);
  double get r => getVerticalSize(validate);

  SizedBox get vs => SizedBox(height: getVerticalSize(validate));
  SizedBox get hs => SizedBox(width: getHorizontalSize(validate));
  EdgeInsetsDirectional get ph => getPadding(horizontal: validate);
  EdgeInsetsDirectional get pv => getPadding(vertical: validate);
// double get w=>getSize(this);
// double get w=>getSize(this);
}