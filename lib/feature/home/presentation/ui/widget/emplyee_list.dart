import 'package:flutter/material.dart';
import 'package:mostafamorsy/core/constants/data/employee_data.dart';
import 'package:mostafamorsy/core/constants/models/employee/employee_model.dart';
import 'package:mostafamorsy/feature/home/presentation/ui/widget/footer_bar.dart';
import 'package:mostafamorsy/feature/home/presentation/ui/widget/section_title.dart';
import 'EmployeeTile.dart';

class EmployeeListScreen extends StatelessWidget {
  EmployeeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentEmployees =
    EmployeeData.employees.where((e) => e.fromDate.isAfter(DateTime.now())).toList();
    final previousEmployees =
    EmployeeData.employees.where((e) => !e.fromDate.isAfter(DateTime.now())).toList();

    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              SectionTitle(title: 'Current employees'),
              ...currentEmployees.map(employeeTile),
              SectionTitle(title:'Previous employees'),
              ...previousEmployees.map(employeeTile),
            ],
          ),
        ),
        const FooterBar(),
      ],
    );
  }



  Widget employeeTile(EmployeeModel e) => EmployeeTile(e: e,);
}
