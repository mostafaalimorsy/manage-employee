import 'package:flutter/material.dart';
import 'package:mostafamorsy/config/routes/app_routes.dart';
import 'package:mostafamorsy/core/app_exports/app_export.dart';
import 'package:mostafamorsy/core/constants/data/employee_data.dart';
import 'package:mostafamorsy/feature/home/presentation/ui/widget/emplyee_list.dart';
import 'package:mostafamorsy/feature/home/presentation/ui/widget/empty_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // add button
        floatingActionButton:  FloatingActionButton(
          onPressed: () {
            // Add employee logic
            Navigator.pushNamed(context, Routes.addEmployeeRoute);
          },
          backgroundColor: AppColors.primaryColor,
          child:  const AppImage(assetPath: AppAssets.addIcon),
        ),

        // appbar
        appBar: AppBar(
          title: const Text("Employee List"),
        ),
        body: EmployeeData.employees.isNotEmpty ? EmployeeListScreen() : const EmptyWidget());
  }
}
