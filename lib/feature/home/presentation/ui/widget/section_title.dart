import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  String title;
   SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
