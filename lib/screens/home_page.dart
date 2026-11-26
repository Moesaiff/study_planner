
import 'package:flutter/material.dart';
import 'package:study_planner/screens/Second_screen.dart';
import 'package:study_planner/summary_cards.dart';
import 'package:study_planner/screens/home_page.dart';

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

int get totalHours {
  int total = goals.fold(0, (sum, goal) {
    return sum + (goal['hours'] as int);
  });

  return total;
}
int get completedGoals{
   return goals.where((goal){
    return goal['done'] == true;
   }).length;
}
int get remainingGoals {
    return goals.where((goal){
        return goal['done'] == false;
    }).length;
}
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
            Row(
                children: [
                    Expanded(
                    child: SummaryCard(
                        title: 'Total Hours',
                        value: totalHours,
                    ),
                    ),
                    Expanded(child: SummaryCard(title: "Completed Goals", value: completedGoals)),
                    Expanded(child: SummaryCard(title: "Remaining Goals ", value: remainingGoals))
                ],
),
                    Expanded(
                child: goals.isEmpty? Center(
                child: Text(
                    'No study goals yet! Add a goal to get started.',
                ),
                )


                :ListView.builder(

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
        onPressed: () async{
            final newGoal = await Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen()));
            if (newGoal != null){setState(() {
                goals.add(newGoal);
            });
            }
        },
        child: const Icon(Icons.add),
        ),
    );
    }
}