import 'package:mostafamorsy/core/constants/models/role/roleModel.dart';

class RoleData{
  RoleData._internal();


  static List roles = [
    RoleModel(id: '1', role: 'Product Designer'),
    RoleModel(id: '2', role: 'Flutter Developer'),
    RoleModel(id: '3', role: 'QA Tester'),
    RoleModel(id: '4', role: 'Product Owner'),
  ];

}