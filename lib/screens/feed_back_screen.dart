import 'package:flutter/material.dart';

class FeedBackScreen extends StatelessWidget {
  static const routeName = '/feedBack';
  const FeedBackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
          ),
        ),
        title: const Text('Feedback'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 2,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => null,
        child: const CircleAvatar(
          child: Icon(
            Icons.question_mark_rounded,
          ),
        ),
      ),
    );
  }
}
