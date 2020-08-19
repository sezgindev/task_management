import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:task_management/Controller/TaskController.dart';
import 'package:task_management/Screens/AddScreen.dart';
import 'package:task_management/Screens/WeekDropdown.dart';
import 'package:task_management/Screens/HomeScreen.dart';
import 'package:task_management/Screens/WeeklyListview.dart';

class WeeklyScreen extends StatefulWidget {
  @override
  _WeeklyScreenState createState() => _WeeklyScreenState();
}

TaskController tsk = new TaskController();
TextEditingController weeklyTitleController = new TextEditingController();
TextEditingController weeklyDescriptionController = new TextEditingController();
TextEditingController weeklyControllerWeek=new TextEditingController();
TextEditingController weeklyControllerMonth=new TextEditingController();
class _WeeklyScreenState extends State<WeeklyScreen> {
  @override
  Widget build(BuildContext context) {
    return   Stack(
      children: [
        WeeklyList(),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FloatingActionButton(
              onPressed: () {
                tsk.getWeekly();
                //Navigator.pushNamed(context, AddScreen.id);
                Alert(
                  context: context,
                  type: AlertType.success,
                  title: "Emin Misiniz?",
                  desc: "Haftalık görev eklemesi yapınız",
                  style: AlertStyle(
                    titleStyle: TextStyle(
                      color: Colors.white,
                    ),
                    descStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  content: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.title),
                          labelText: 'Title',
                        ),
                        controller: weeklyTitleController,
                      ),
                      TextField(
                        maxLines: 2,
                        decoration: InputDecoration(
                          icon: Icon(Icons.description),
                          labelText: 'Description',
                        ),
                        controller: weeklyDescriptionController,
                      ),
                      Dropdown(),
                    ],
                  ),
                  buttons: [
                    DialogButton(
                      child: Text(
                        "Ekle",
                        style: TextStyle(
                            color: Colors.white, fontSize: 20),
                      ),
                      color: Color.fromRGBO(0, 179, 134, 1.0),
                      onPressed: () {
                        weeklyTitleList.add(weeklyTitleController.text);
                        weeklyDescList.add(weeklyDescriptionController.text);
                        weeklyWeekList.add(weeklyControllerWeek.text);
                        weeklyMonthList.add(weeklyControllerMonth.text);

                        tsk.addWeekly();
                        tsk.getWeekly();
                        Navigator.pushNamed(context, HomeScreen.id);
                      },
                    ),
                  ],
                ).show();
              },
              child: Icon(Icons.add),
            ),
          ),
        ),
      ],
    );
  }
}
