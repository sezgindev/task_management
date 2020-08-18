import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<String> titleList = List<String>();
List<String> descList = List<String>();

class TaskController {
  addDaily(String a, String b) async {
    titleList.add(a);
    descList.add(b);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('title', titleList);

    prefs.setStringList("description", descList);
  }

  getDaily() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> getTitle = prefs.getStringList('title');
    List<String> getDesc = prefs.getStringList('description');
    print(getTitle);
    print(getDesc);
  }
}
