import 'package:flutter/material.dart';
import 'package:mostafamorsy/core/app_exports/app_export.dart';
import 'package:mostafamorsy/core/constants/data/role_data.dart';
import 'package:mostafamorsy/core/constants/models/role/roleModel.dart';

import '../../../../../core/utils/widgets/custom_data_picker/customDatePickerFROM.dart';

class AddEmployeeDetailsScreen extends StatefulWidget {
  @override
  _AddEmployeeDetailsScreenState createState() =>
      _AddEmployeeDetailsScreenState();
}

class _AddEmployeeDetailsScreenState extends State<AddEmployeeDetailsScreen> {
  TextEditingController _employeeNameController = TextEditingController();
  RoleModel? _selectedRole;
  DateTime? _startDate = DateTime.now();
  DateTime? _endDate;

  // Example roles

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _startDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _startDate) {
      setState(() {
        _startDate = picked;
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _endDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _endDate) {
      setState(() {
        _endDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Add Employee Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Employee Name
            TextFormField(
              controller: _employeeNameController,
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.person_2_outlined,
                  color: AppColors.primaryColor,
                ),
                hintText: 'Employee name',
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.greyColor)),
              ),
            ),
            const SizedBox(height: 16.0),

            // Select Role
            InputDecorator(
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.work_outline,
                  color: AppColors.primaryColor,
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.greyColor)),
              ),
              child: DropdownButtonHideUnderline(
                child: SizedBox(
                  height: 40.h,
                  child: DropdownButton<dynamic>(
                    icon: Icon(
                      Icons.arrow_drop_down_rounded,
                      color: AppColors.primaryColor,
                    ),
                    value: _selectedRole,
                    isExpanded: true,
                    hint: const Text('Select role'),
                    items: RoleData.roles.map((dynamic value) {
                      return DropdownMenuItem<RoleModel>(
                        value: value,
                        child: Text(value.role),
                      );
                    }).toList(),
                    onChanged: (dynamic newValue) {
                      setState(() {
                        _selectedRole = newValue;
                      });
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            // Date Range
            Row(
              children: <Widget>[
                Expanded(
                  child: InkWell(
                    onTap: () => _selectStartDate(context),
                    child: InputDecorator(
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                            padding: EdgeInsets.all(8),
                            child: AppImage(assetPath: AppAssets.dateIcon)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.greyColor)),
                      ),
                      child: Text(
                        _startDate != null
                            ? "${_startDate!.day}/${_startDate!.month}/${_startDate!.year}"
                            : 'Today', // You can adjust the initial text
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 9.0),
                    child: SizedBox(
                        height: 20.h,
                        width: 20.w,
                        child: const AppImage(
                          assetPath: AppAssets.arrowIcon,
                          fit: BoxFit.fitWidth,
                        ))),
                Expanded(
                  child: InkWell(
                    onTap: () => _selectEndDate(context),
                    child: InputDecorator(
                      decoration: const InputDecoration(
                        prefixIcon: Padding(
                            padding: EdgeInsets.all(8),
                            child: AppImage(assetPath: AppAssets.dateIcon)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.greyColor)),
                      ),
                      child: Text(
                        _endDate != null
                            ? "${_endDate!.day}/${_endDate!.month}/${_endDate!.year}"
                            : 'No date', // You can adjust the initial text
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24.0),

            // Add more fields here if needed
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: AppColors.greyColor.withValues(alpha: 0.3),width: 2))
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[

              ElevatedButton(
                onPressed: () {
                  // Handle cancel logic
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: AppColors.secondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  // Match the button color
                ),
                child: const Text('Cancel',
                    style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.w500)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: ElevatedButton(
                  onPressed: () {
                    // Handle save logic
                    String employeeName = _employeeNameController.text;
                    RoleModel? role = _selectedRole;
                    DateTime? startDate = _startDate;
                    DateTime? endDate = _endDate;

                    print('Employee Name: $employeeName');
                    print('Selected Role: $role');
                    print('Start Date: $startDate');
                    print('End Date: $endDate');

                    // You would typically send this data to your backend or store it locally
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    // Match the button color
                  ),
                  child: const Text('Save',  style: TextStyle(color: AppColors.whiteColor, fontWeight: FontWeight.w500)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
