
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

    List<Map<String, dynamic>> goals = [
        {
        'subject': 'Flutter',
        'hours': 3,
        'done': false,
        },
        {
        'subject': 'Java',
        'hours': 2,
        'done': false,
        },
        {
        'subject': 'Database',
        'hours': 4,
        'done': false,
        },
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // STATIC - AppBar
        appBar: AppBar(
        title: Center(child: const Text('My study goals')),
        ),

      // // STATIC - Body
        body: Column(
        children: [
                    Expanded(
        child: ListView.builder(
            itemCount: goals.length,
            itemBuilder: (context, index) {
            return Card(
                child: ListTile(
                    leading: Checkbox(
                        // LOGIC - Update goal completion status
                    value: goals[index]['done'],
                    onChanged: (value) {
                        setState(() {
                        goals[index]['done'] = value;
                        });
                    },
                    ),
                    title: Text(
                        // LOGIC - Apply strikethrough to completed goals
                        goals[index]['subject'],
                        style: TextStyle(
                            decoration: goals[index]['done'] == true
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                        ),
),
                    subtitle: Text('${goals[index]['hours']} Hours'),
                    // LOGIC - Delete selected goal
                    trailing: IconButton(onPressed: () {setState(() {
                      goals.removeAt(index);
                    });},icon: const Icon(Icons.delete)),
                ),
            );
            },

        ),
        ),
        ],
        ),
      // STATIC - FloatingActionButton
        floatingActionButton: FloatingActionButton(
            // LOGIC - Add a new sample goal
        onPressed: () {setState(() {
           goals.add({
                'subject': 'Python',
                'hours': 3,
                'done': false,
            });
        });

        },
        child: const Icon(Icons.add),
        ),
    );
  }
}