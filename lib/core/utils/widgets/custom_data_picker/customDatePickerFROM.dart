import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarDialog extends StatefulWidget {
  const CalendarDialog({super.key});

  @override
  _CalendarDialogState createState() => _CalendarDialogState();
}

class _CalendarDialogState extends State<CalendarDialog> {
  DateTime _selectedDate = DateTime.now();
  DateTime _currentMonth = DateTime(2022, 9); // September 2022

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildMonthHeader(),
            const SizedBox(height: 16),
            _buildCalendarGrid(),
            const SizedBox(height: 16),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildMonthHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          DateFormat('MMMM yyyy').format(_currentMonth),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.chevron_left),
              onPressed: () => _changeMonth(-1),
            ),
            IconButton(
              icon: const Icon(Icons.chevron_right),
              onPressed: () => _changeMonth(1),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCalendarGrid() {
    final firstDay = DateTime(_currentMonth.year, _currentMonth.month, 1);
    final lastDay = DateTime(_currentMonth.year, _currentMonth.month + 1, 0);
    final daysInMonth = lastDay.day;
    final startingWeekday = firstDay.weekday;

    return Table(
      border: TableBorder.all(color: Colors.grey.shade300),
      children: [
        const TableRow(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey)),
          ),
          children: [
            _CalendarHeader('Sun'),
            _CalendarHeader('Mon'),
            _CalendarHeader('Tue'),
            _CalendarHeader('Wed'),
            _CalendarHeader('Thu'),
            _CalendarHeader('Fri'),
            _CalendarHeader('Sat'),
          ],
        ),
        ..._buildCalendarRows(startingWeekday, daysInMonth),
      ],
    );
  }

  List<TableRow> _buildCalendarRows(int startingWeekday, int daysInMonth) {
    List<TableRow> rows = [];
    List<Widget> currentRow = [];
    int dayCounter = 1;
    int totalCells = 0;
    // Add empty cells for days before the 1st of the month
    for (int i = 1; i < startingWeekday; i++) {
      currentRow.add(const SizedBox(height: 40));
      totalCells++;
    }
    // Fill remaining cells if needed
    while (totalCells % 7 != 0) {
      currentRow.add(const SizedBox(height: 40));
      totalCells++;
    }
    // Add all days of the month
    while (dayCounter <= daysInMonth) {
      for (int i = startingWeekday; i <= 7 && dayCounter <= daysInMonth; i++) {
        final day = dayCounter;
        final date = DateTime(_currentMonth.year, _currentMonth.month, day);
        final isToday = _isSameDate(date, DateTime.now());
        final isSelected = _isSameDate(date, _selectedDate);

        currentRow.add(
          GestureDetector(
            onTap: () => setState(() => _selectedDate = date),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: isSelected ? Colors.blue : null,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(
                day.toString(),
                style: TextStyle(
                  color: isSelected
                      ? Colors.white
                      : isToday
                          ? Colors.blue
                          : Colors.black,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ),
        );
        dayCounter++;
      }
      rows.add(TableRow(children: [...currentRow]));
      currentRow = [];
      startingWeekday = 1; // Reset to Sunday for subsequent weeks
    }

    return rows;
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () => setState(() => _selectedDate = DateTime.now()),
          child: const Text('Today'),
        ),
        Row(
          children: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            const SizedBox(width: 8),
            TextButton(
              onPressed: () => Navigator.pop(context, _selectedDate),
              child: const Text(
                'Save',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _changeMonth(int delta) {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + delta);
    });
  }

  bool _isSameDate(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}

class _CalendarHeader extends StatelessWidget {
  final String text;

  const _CalendarHeader(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    );
  }
}
