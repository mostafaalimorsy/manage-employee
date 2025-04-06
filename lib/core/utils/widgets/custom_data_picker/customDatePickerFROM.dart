import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomDatePickerFrom extends StatelessWidget {
  final DateTime selectedDate;

  const CustomDatePickerFrom({super.key, required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Shortcut Buttons
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _DateShortcutButton(label: 'Today', onTap: () {}),
            _DateShortcutButton(label: 'Next Monday', onTap: () {}),
            _DateShortcutButton(label: 'Next Tuesday', onTap: () {}),
            _DateShortcutButton(label: 'After 1 week', onTap: () {}),
          ],
        ),

        const SizedBox(height: 16),

        // Calendar Widget
        TableCalendar(
          firstDay: DateTime.utc(2020),
          lastDay: DateTime.utc(2030),
          focusedDay: selectedDate,
          selectedDayPredicate: (day) => isSameDay(day, selectedDate),
          onDaySelected: (selectedDay, focusedDay) {
            // Handle selection
          },
        ),

        const Divider(),

        // Footer
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 18, color: Colors.blue),
                const SizedBox(width: 8),
                Text(DateFormat('d MMM yyyy').format(selectedDate)),
              ],
            ),
            Row(
              children: [
                TextButton(onPressed: () {}, child: const Text('Cancel')),
                ElevatedButton(onPressed: () {}, child: const Text('Save')),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _DateShortcutButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _DateShortcutButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(label),
    );
  }
}
