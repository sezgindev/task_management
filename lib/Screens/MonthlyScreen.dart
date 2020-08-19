import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:task_management/Controller/TaskController.dart';
import 'package:task_management/Screens/MonthlyDropdown.dart';
import 'package:task_management/Screens/HomeScreen.dart';
import 'package:task_management/Screens/MonthlyListview.dart';
class MonthlyScreen extends StatefulWidget {
  @override
  _MonthlyScreenState createState() => _MonthlyScreenState();
}
TaskController tsk=new TaskController();
TextEditingController titleControllerMnt=new TextEditingController();
TextEditingController descriptionControllerMnt=new TextEditingController();
TextEditingController monthlyControllerMnt=new TextEditingController();

class _MonthlyScreenState extends State<MonthlyScreen> {
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        MonthlyListview(),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FloatingActionButton(
              onPressed: () {
                tsk.getMonthly();
                //Navigator.pushNamed(context, AddScreen.id);
                Alert(
                  context: context,
                  type: AlertType.success,
                  title: "Emin Misiniz?",
                  desc: "Aylık görev eklemesi yapınız",
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
                        controller: titleControllerMnt,
                      ),
                      TextField(
                        maxLines: 2,
                        decoration: InputDecoration(
                          icon: Icon(Icons.description),
                          labelText: 'Description',
                        ),
                        controller: descriptionControllerMnt,
                      ),
                      MonthlyDropdown(),
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
                        monthlyTitleList.add(titleControllerMnt.text);
                        monthlyDescList.add(descriptionControllerMnt.text);
                        monthlyMonthList.add(monthlyControllerMnt.text);
                        tsk.addMonthly();
                        tsk.getMonthly();
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
