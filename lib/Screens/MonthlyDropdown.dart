import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_management/Controller/TaskController.dart';
import 'package:task_management/Screens/MonthlyScreen.dart';

class MonthlyDropdown extends StatefulWidget {
  @override
  _MonthlyDropdownState createState() => _MonthlyDropdownState();
}

String dropdownValue = 'Ocak';

class _MonthlyDropdownState extends State<MonthlyDropdown> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    monthlyControllerMnt.text=dropdownValue;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DropdownButton<String>(
          value: dropdownValue,
          icon: Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 10,
          style: TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String newValue) {
            setState(() {
              dropdownValue = newValue;
              monthlyControllerMnt.text=newValue;
            });
          },
          items: <String>[
            'Ocak',
            'Şubat',
            'Mart',
            'Nisan',
            'Mayıss',
            'Haziran',
            'Temmuz',
            'Ağustos',
            'Eylül',
            'Ekim',
            'Kasım',
            'Aralık'
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}
