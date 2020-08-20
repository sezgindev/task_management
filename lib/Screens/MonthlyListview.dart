import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:task_management/Controller/TaskController.dart';
import 'package:task_management/Screens/HomeScreen.dart';
import 'package:task_management/Screens/MonthlyScreen.dart';

TaskController a = new TaskController();

class MonthlyListview extends StatefulWidget {
  @override
  _MonthlyListviewState createState() => _MonthlyListviewState();
}

class _MonthlyListviewState extends State<MonthlyListview> {
  @override
  void initState() {
    // TODO: implement initState
    a.getMonthly();
    super.initState();
  }

  @override
  void setState(fn) {
    // TODO: implement setState

    a.getMonthly();
    super.setState(fn);
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
              itemCount: monthlyTitle.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: height * 0.04),
                  child: InkWell(
                    onTap: (){
                      Alert(
                          context: context,
                          type: AlertType.success,
                          title: "${monthlyTitle.elementAt(index)}",
                          desc: "${monthlyDescription.elementAt(index)}" +
                              "\n" + "\n"+
                              " ${monthlyMonth.elementAt(index)}" ,

                          buttons: [
                            DialogButton(
                              onPressed: () {
                                Navigator.pushNamed(context, HomeScreen.id);
                              },
                              child: Text("Geri"),
                            ),
                          ]).show();
                    },
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
                            child: new Text(
                              "${monthlyMonth.elementAt(index)}",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          title: Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Container(
                              child: new Text(
                                "${monthlyTitle.elementAt(index)}",
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          subtitle: Container(
                            child: new Text(
                              "${monthlyDescription.elementAt(index)}",
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
                                              monthlyTitleList.removeAt(index);
                                              monthlyDescList.removeAt(index);
                                              monthlyMonthList.removeAt(index);
                                              a.addMonthly();
                                              a.getMonthly();
                                              print("zxvxcb");
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
                              // icon-1
                              // icon-2
                            ],
                          ),
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
