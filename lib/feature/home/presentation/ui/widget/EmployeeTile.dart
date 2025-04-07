import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mostafamorsy/config/routes/app_routes.dart';
import 'package:mostafamorsy/core/constants/data/employee_data.dart';
import 'package:mostafamorsy/core/constants/models/employee/employee_model.dart';

import '../../../../../core/app_exports/app_export.dart';

class EmployeeTile extends StatefulWidget {
  EmployeeModel e;
   EmployeeTile({super.key, required this.e});

  @override
  State<EmployeeTile> createState() => _EmployeeTileState();
}

class _EmployeeTileState extends State<EmployeeTile> {
  final customFormat = DateFormat('d MMM, yyyy');

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, Routes.addEmployeeRoute),
      child: Dismissible(
        onDismissed: (direction) {
          EmployeeData.employees.removeWhere((item) => item == widget.e);



          return log("message");
        },
        direction: DismissDirection.endToStart,
        background: Container(
          alignment: Alignment.centerRight,
          color: AppColors.redColor,
          padding: EdgeInsets.symmetric(vertical: 43, horizontal: 22),
          child: AppImage(assetPath: AppAssets.deleteIcon),
        ),
        key: Key(widget.e.name),
        child: ListTile(
          title:
          Text(widget.e.name, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.e.role),
              const SizedBox(height: 4),
              Text(
                widget.e.toDate == null
                    ? 'From ${widget.e.fromDate}'
                    : '${customFormat.format(widget.e.fromDate)} - ${customFormat.format(widget.e.toDate)}',
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        ),
      ),
    );
  }
}
