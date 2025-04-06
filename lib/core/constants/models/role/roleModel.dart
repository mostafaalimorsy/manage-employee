import 'package:hive/hive.dart';

class RoleModel extends HiveObject {

  final String id;


  final String role;

  RoleModel({
    required this.id,
    required this.role,
  });

  // Optional JSON helpers
  Map<String, dynamic> toJson() => {
    'id': id,
    'role': role,
  };

  factory RoleModel.fromJson(Map<String, dynamic> json) => RoleModel(
    id: json['id'],
    role: json['role'],
  );
}
