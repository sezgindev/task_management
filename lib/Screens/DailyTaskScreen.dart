import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class DailyTaskScreen extends StatefulWidget {
  @override
  _DailyTaskScreenState createState() => _DailyTaskScreenState();
}


class _DailyTaskScreenState extends State<DailyTaskScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: FlatButton(
            onPressed: () {
              DatePicker.showDatePicker(context,
                  showTitleActions: true,
                  minTime: DateTime(2020, 3, 5),
                  maxTime: DateTime(2025, 6, 7), onChanged: (date) {
                    print('change $date');
                  }, onConfirm: (date) {
                    print('confirm $date');
                  }, currentTime: DateTime.now(), locale: LocaleType.tr);
            },
            child: Text(
              'show date time picker (Chinese)',
              style: TextStyle(color: Colors.blue),
            )),
      ),


    );
  }
}
