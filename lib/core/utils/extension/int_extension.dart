import 'package:flutter/material.dart';
import 'package:mostafamorsy/core/utils/app_size/app_size.dart';

extension IntNullExtension on int? {
  /// Validate given int is not null and returns given value if null.

  int get validate => this ?? 0;

  /// Returns microseconds duration
  /// 5.microseconds
  Duration get microseconds => Duration(microseconds: validate);

  /// Returns milliseconds duration
  /// ```dart
  /// 5.milliseconds
  /// ```

  /// Returns seconds duration
  /// ```dart
  /// 5.seconds
  /// ```
  Duration get seconds => Duration(seconds: validate);

  /// Returns minutes duration
  /// ```dart
  /// 5.minutes
  /// ```
  Duration get minutes => Duration(minutes: validate);

  /// Returns hours duration
  /// ```dart
  /// 5.hours
  /// ```
  Duration get hours => Duration(hours: this.validate);

  /// Returns days duration
  /// ```dart
  /// 5.days
  /// ```
  Duration get days => Duration(days: validate);
  Duration get milliseconds => Duration(milliseconds: validate);
  SizedBox get vs => SizedBox(height: getVerticalSize(validate.toDouble()));
  SizedBox get hs => SizedBox(width: getHorizontalSize(validate.toDouble()));
  EdgeInsetsDirectional get ph => getPadding(horizontal: validate.toDouble());
  EdgeInsetsDirectional get pv => getPadding(vertical: validate.toDouble());
  bool isSuccessful() => validate >= 200 && validate <= 206;
  double get h => getVerticalSize(validate.toDouble());
  double get w => getHorizontalSize(validate.toDouble());
  double get r => getVerticalSize(validate.toDouble());
  int get toPositive => validate<0? validate*-1:validate;
}