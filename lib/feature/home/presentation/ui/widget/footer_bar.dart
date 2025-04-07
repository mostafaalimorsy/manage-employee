import 'package:flutter/material.dart';

class FooterBar extends StatelessWidget {
  const FooterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.all(16),
      alignment: Alignment.centerLeft,
      child: Text(
        'Swipe left to delete',
        style: TextStyle(color: Colors.grey[600]),
      ),
    );
  }
}