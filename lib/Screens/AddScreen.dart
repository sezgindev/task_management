import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_management/Controller/TaskController.dart';

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
  static const String id = "AddScreen";
}

TaskController cnt = new TaskController();
TextEditingController nameController = TextEditingController();
TextEditingController descriptionController = TextEditingController();

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(
                border: InputBorder.none, hintText: 'Enter a search term'),
            controller: nameController,
          ),
          TextField(
            decoration: InputDecoration(
                border: InputBorder.none, hintText: 'Enter a search term'),
            controller: descriptionController,
          ),
          RaisedButton(
            child: Text("dfg"),
            onPressed: () {

              cnt.addWeekly();
              cnt.getWeekly();
            },
          ),
        ],
      ),
    );
  }
}
