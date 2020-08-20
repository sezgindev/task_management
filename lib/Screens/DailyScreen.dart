import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:task_management/Controller/TaskController.dart';
import 'package:task_management/Screens/DailyList.dart';
import 'package:task_management/Screens/DayConvertToString.dart';

import 'package:task_management/Screens/HomeScreen.dart';


class DailyScreen extends StatefulWidget {
  @override
  _DailyScreenState createState() => _DailyScreenState();
}

TaskController tsk = new TaskController();
TextEditingController dailyTitleController = new TextEditingController();
TextEditingController dailyDescriptionController = new TextEditingController();
TextEditingController dailyControllerDay = new TextEditingController();
TextEditingController dailyControllerMonth = new TextEditingController();

class _DailyScreenState extends State<DailyScreen> {


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DailyList(),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FloatingActionButton(
              onPressed: () {
                tsk.getDaily();
                //Navigator.pushNamed(context, AddScreen.id);
                Alert(
                  context: context,
                  type: AlertType.success,
                  title: "Emin Misiniz?",
                  desc: "Günlük görev eklemesi yapınız",
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
                        controller: dailyTitleController,
                      ),
                      TextField(
                        maxLines: 2,
                        decoration: InputDecoration(
                          icon: Icon(Icons.description),
                          labelText: 'Description',
                        ),
                        controller: dailyDescriptionController,
                      ),
                      FlatButton(
                          onPressed: () {
                            DatePicker.showDatePicker(context,
                                showTitleActions: true,
                                minTime: DateTime(2020, 1, 1),
                                maxTime: DateTime(2030, 12, 31),
                                onChanged: (date) {
                                  dailyControllerDay.text=date.day.toString();
                                  dailyControllerMonth.text=date.month.toString();
                            }, onConfirm: (date) {

                              dailyControllerDay.text=date.day.toString();
                              dailyControllerMonth.text=convertToString(date.month);
                            },
                                currentTime: DateTime.now(),
                                locale: LocaleType.tr);
                          },
                          child: Text(
                            'Gün seçiniz',
                            style: TextStyle(color: Colors.blue),
                          )),
                    ],
                  ),
                  buttons: [
                    DialogButton(
                      child: Text(
                        "Ekle",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      color: Color.fromRGBO(0, 179, 134, 1.0),
                      onPressed: () {
                        dailyTitleList.add(dailyTitleController.text);
                        dailyDescList.add(dailyDescriptionController.text);
                        dailyDayList.add(dailyControllerDay.text);
                        dailyMonthList.add(dailyControllerMonth.text);
                        tsk.addDaily();
                        tsk.getDaily();
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
