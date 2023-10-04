import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Calendar extends StatelessWidget {
  const Calendar({
    super.key,
    required this.calendarHeight,
  });
  final double calendarHeight;
  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    String dateFormat = DateFormat('EEEEE').format(date);
    return Container(
      height: calendarHeight,
      color: const Color.fromARGB(255, 198, 190, 211),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            calendarBubble(
                day: 'Su',
                number: 1,
                isToday: dateFormat == 'Sunday' ? true : false),
            calendarBubble(
                day: 'Mo',
                number: 2,
                isToday: dateFormat == 'Monday' ? true : false),
            calendarBubble(
                day: 'Tu',
                number: 3,
                isToday: dateFormat == 'Tuesday' ? true : false),
            calendarBubble(
                day: 'We',
                number: 4,
                isToday: dateFormat == 'Wednesday' ? true : false),
            calendarBubble(
                day: 'Th',
                number: 5,
                isToday: dateFormat == 'Thursday' ? true : false),
            calendarBubble(
                day: 'Fr',
                number: 6,
                isToday: dateFormat == 'Friday' ? true : false),
            calendarBubble(
                day: 'Sa',
                number: 7,
                isToday: dateFormat == 'Saturday' ? true : false)
          ],
        ),
      ),
    );
  }

  Container calendarBubble({
    required String day,
    required int number,
    required bool isToday,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: isToday
            ? const Color.fromARGB(255, 162, 42, 184)
            : Colors.transparent,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
          bottom: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            day,
            style: TextStyle(
              fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
              color: isToday ? Colors.black : Colors.grey,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isToday
                  ? const Color.fromARGB(255, 198, 190, 211)
                  : Colors.transparent,
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              shape: BoxShape.circle,
            ),
            child: Text(
              '$number',
              style: TextStyle(
                fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                color: isToday ? Colors.black : Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// const Center(
//         child: Text(
//           'Implement Calendar Here',
//           style: TextStyle(
//             fontSize: 17,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       ),