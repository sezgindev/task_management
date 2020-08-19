import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:task_management/Controller/TaskController.dart';
import 'package:task_management/Screens/HomeScreen.dart';

class WeeklyList extends StatefulWidget {
  @override
  _WeeklyListState createState() => _WeeklyListState();
}

TaskController a = new TaskController();

class _WeeklyListState extends State<WeeklyList> {
  @override
  void initState() {
    // TODO: implement initState
    a.getWeekly();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xfff1f1f1),
      body: Center(
        child: Container(
          width: width * 0.8,
          child: ListView.builder(
              itemCount: weeklyTitle.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: height * 0.04),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          new BorderRadius.all(const Radius.circular(20.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          spreadRadius: 2,
                          blurRadius: 1,
                          offset: Offset(0, 3),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              new Text(
                                "${weeklyMont.elementAt(index)}",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 15),
                              ),
                              new Text(
                                "${weeklyWeek.elementAt(index)}",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Container(
                            child: new Text(
                              "${weeklyTitle.elementAt(index)}",
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        subtitle: Container(
                          child: new Text(
                            "${weeklyDescription.elementAt(index)}",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        trailing: Wrap(
                          spacing: 12, // space between two icons
                          children: <Widget>[
                            IconButton(
                              icon: Icon(
                                Icons.cancel,
                                color: Colors.red,
                                size: 40,
                              ),
                              onPressed: () {
                                Alert(
                                    context: context,
                                    type: AlertType.success,
                                    title: "Emin Misiniz?",
                                    desc: "Silmek istediğinize emin misiniz?",
                                    buttons: [
                                      DialogButton(
                                        onPressed: () {
                                          setState(() {
                                            weeklyTitleList.removeAt(index);
                                            weeklyDescList.removeAt(index);
                                            weeklyMonthList.removeAt(index);
                                            weeklyWeekList.removeAt(index);
                                            a.addWeekly();
                                            a.getWeekly();

                                            Navigator.pushNamed(
                                                context, HomeScreen.id);
                                          });
                                        },
                                        child: Text("Evet"),
                                      ),
                                      DialogButton(
                                        child: Text("Hayır"),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      )
                                    ]).show();
                              },
                            ),
                            // icon-2
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
