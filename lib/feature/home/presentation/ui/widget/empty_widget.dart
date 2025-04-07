import 'package:flutter/material.dart';
import 'package:mostafamorsy/core/app_exports/app_export.dart';


class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 245.h,
        width: 262.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 219.h,
                child: const AppImage(assetPath: AppAssets.emptyIcon)),
            Text(
              "No employee records found",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: getFontSize(18),
              ),
            )
          ],
        ),
      ),
    );
  }
}
