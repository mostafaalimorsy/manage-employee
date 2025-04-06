import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mostafamorsy/core/utils/widgets/buttons/cleander_button.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomDataPickerTo extends StatefulWidget {
  const CustomDataPickerTo({super.key});

  @override
  State<CustomDataPickerTo> createState() => _CustomDataPickerToState();
}

class _CustomDataPickerToState extends State<CustomDataPickerTo> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header buttons
        Row(
          children: [
            TopButton(
              label: 'No date',
              isSelected: selectedDate == null,
              onTap: () => setState(() => selectedDate = null),
            ),
            TopButton(
              label: 'Today',
              onTap: () => setState(() => selectedDate = DateTime.now()),
            ),
          ],
        ),

        SizedBox(height: 16),

        // Calendar
        TableCalendar(
          firstDay: DateTime.utc(2020),
          lastDay: DateTime.utc(2030),
          focusedDay: selectedDate ?? DateTime.now(),
          selectedDayPredicate: (day) =>
          selectedDate != null && isSameDay(day, selectedDate),
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              selectedDate = selectedDay;
            });
          },
        ),

        Divider(),

        // Footer
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.calendar_today, size: 18, color: Colors.blue),
                SizedBox(width: 8),
                Text(
                  selectedDate != null
                      ? DateFormat('d MMM yyyy').format(selectedDate!)
                      : 'No date',
                ),
              ],
            ),
            Row(
              children: [
                TextButton(onPressed: () {}, child: Text('Cancel')),
                ElevatedButton(onPressed: () {}, child: Text('Save')),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
