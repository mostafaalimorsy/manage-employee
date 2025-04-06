import 'package:hive/hive.dart';

part 'employee_model.g.dart';

@HiveType(typeId: 0)
class EmployeeModel extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String role;

  @HiveField(2)
  final DateTime fromDate;

  @HiveField(3)
  final DateTime toDate;

  EmployeeModel({
    required this.name,
    required this.role,
    required this.fromDate,
    required this.toDate,
  });

  // Optional: JSON support if you ever want to serialize to JSON
  Map<String, dynamic> toJson() => {
    'name': name,
    'role': role,
    'fromDate': fromDate.toIso8601String(),
    'toDate': toDate.toIso8601String(),
  };

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
    name: json['name'],
    role: json['role'],
    fromDate: DateTime.parse(json['fromDate']),
    toDate: DateTime.parse(json['toDate']),
  );
}
