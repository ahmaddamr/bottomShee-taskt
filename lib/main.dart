import 'package:flutter/material.dart';
import 'package:iti_tasks/form_screen.dart';
import 'package:iti_tasks/form_task/auth_screen.dart';

void main() {
  runApp(const FirstTask());
}

class FirstTask extends StatelessWidget {
  const FirstTask({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AuthScreen(),
    );
  }
}
