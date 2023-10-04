import 'package:flutter/material.dart';
import 'package:todo_2_0/widgets/bottom_sheets/add_task.dart';

import '../tools/calendar.dart';

class RoutineClass extends StatelessWidget {
  const RoutineClass({
    super.key,
    required this.screenHeight,
  });
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    double calendarHeight = screenHeight * 0.15;
    double height = screenHeight - kToolbarHeight - calendarHeight;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 198, 190, 211),
      appBar: AppBar(
        title: const Text('Today'),
        foregroundColor: Colors.black,
        backgroundColor: const Color.fromARGB(255, 198, 190, 211),
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Calendar(
            calendarHeight: calendarHeight,
          ),
          Container(
            height: height,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: const Center(
              child: Text('No Tasks For Today yet!'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
          context: context,
          builder: (context) => const AddTask(),
          elevation: 10,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          isScrollControlled: true,
          useSafeArea: true,
        ),
        child: const Icon(
          Icons.add_rounded,
          size: 35,
        ),
      ),
    );
  }
}
// Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         Container(
//           height: screenSize.height * 0.13,
//           color: const Color.fromARGB(255, 211, 209, 214),
//           child: const Center(
//             child: Text(
//               'Today',
//               style: TextStyle(
//                 fontSize: 17,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//         )
//       ],
//     )