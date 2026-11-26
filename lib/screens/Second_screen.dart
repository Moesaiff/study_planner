import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  TextEditingController subjectController = TextEditingController();
  TextEditingController hoursController = TextEditingController();
  @override
    void dispose() {
      subjectController.dispose();
      hoursController.dispose();
      super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Goal'),
      ),
      body:Padding(padding: EdgeInsets.all(16.0),
      child: Column(children: [
        TextField(controller: subjectController,decoration: InputDecoration(
          labelText: 'Subject',
          hintText: 'Enter name of the subject'
        ),),

        TextField(controller: hoursController,keyboardType: TextInputType.number, decoration: InputDecoration(
          labelText: 'Hours',
          hintText: 'Enter the hours you to schedule for this subject'
        ),),

        ElevatedButton(onPressed: (){
          final subject = subjectController.text.trim();
          final hours = int.tryParse(hoursController.text);
          if (subject.isEmpty || hours == null || hours <= 0 ){
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(
              '- Please enter valid subjects ! '
            )));
            return;
          }
          Navigator.pop(context,{
            'subject' : subject ,
            'hours' : hours,
            'done' : false
          });
        }, child:const Text('Save'))
      ],),
      )
    );
  }
}