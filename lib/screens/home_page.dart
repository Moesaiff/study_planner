
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // STATIC - AppBar
        appBar: AppBar(
        title: Center(child: const Text('My Study Planner')),
        ),

      // // STATIC - Body
        body: Column(
        children: [
            const Text('My Study Goals'),
            // STATIC - First Study Goal
        Card(
        child: ListTile(
            title: const Text('Flutter'),
            subtitle: const Text('3 Hours'),
        ),
        ),
        Card(
        child: ListTile(
            title: const Text('Dart'),
            subtitle: const Text('1 Hours'),
        ),
        ),
        Card(
        child: ListTile(
            title: const Text('SQL'),
            subtitle: const Text('7 Hours'),
        ),
        ),
        ],
        ),
      // STATIC - FloatingActionButton
        floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        ),
    );
  }
}