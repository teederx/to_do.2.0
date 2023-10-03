import 'package:flutter/material.dart';

class RoutineClass extends StatelessWidget {
  const RoutineClass({
    super.key,
    required this.screenSize,
  });
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: screenSize.height * 0.15,
          color: const Color.fromARGB(255, 211, 209, 214),
          child: const Center(
            child: Text(
              'Today',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        )
      ],
    );
  }
}
