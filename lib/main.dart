import 'package:flutter/material.dart';
import 'package:mostafamorsy/launch_point.dart';
import 'package:mostafamorsy/services/localStorgae/hive_operation.dart';

Future<void> main() async {
  final storage = HiveStorageService();
  await storage.init();
  runApp(const MyApp());
}



