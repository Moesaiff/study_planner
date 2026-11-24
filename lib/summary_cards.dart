import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
final String title;
final int value;
  const SummaryCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
        Text(title),
        Text(value.toString())
      ],

      ),
    ),
    );
  }
}