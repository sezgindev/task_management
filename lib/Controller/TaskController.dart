import 'package:shared_preferences/shared_preferences.dart';

List<String> weeklyTitleList = List<String>();
List<String> weeklyDescList = List<String>();
List<String> weeklyMonthList = List<String>();
List<String> weeklyWeekList = List<String>();

List<String> weeklyTitle = List<String>();
List<String> weeklyDescription = List<String>();
List<String> weeklyMont = List<String>();
List<String> weeklyWeek = List<String>();

List<String> dailyTitleList = List<String>();
List<String> dailyDescList = List<String>();
List<String> dailyMonthList = List<String>();
List<String> dailyDayList = List<String>();

List<String> dailyTitle = List<String>();
List<String> dailyDescription = List<String>();
List<String> dailyMont = List<String>();
List<String> dailyDay = List<String>();

List<String> monthlyTitleList = List<String>();
List<String> monthlyDescList = List<String>();
List<String> monthlyMonthList = List<String>();

List<String> monthlyTitle = List<String>();
List<String> monthlyDescription = List<String>();
List<String> monthlyMonth = List<String>();

class TaskController {
  addDaily() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('dailyTitle', dailyTitleList);
    prefs.setStringList("dailyDescription", dailyDescList);
    prefs.setStringList("dailyMonth", dailyMonthList);
    prefs.setStringList("dailyDay", dailyDayList);
  }

  getDaily() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> getTitle = prefs.getStringList('dailyTitle');
    List<String> getDesc = prefs.getStringList('dailyDescription');
    List<String> getMonth = prefs.getStringList('dailyMonth');
    List<String> getDay = prefs.getStringList('dailyDay');
    dailyTitle = getTitle;
    dailyDescription = getDesc;
    dailyMont = getMonth;
    dailyDay = getDay;
  }

  addWeekly() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('weeklyTitle', weeklyTitleList);
    prefs.setStringList("weeklyDescription", weeklyDescList);
    prefs.setStringList("weeklyMonth", weeklyMonthList);
    prefs.setStringList("weeklyWeek", weeklyWeekList);
  }

  getWeekly() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> getTitle = prefs.getStringList('weeklyTitle');
    List<String> getDesc = prefs.getStringList('weeklyDescription');
    List<String> getWeek = prefs.getStringList('weeklyMonth');
    List<String> getMonth = prefs.getStringList('weeklyWeek');
    weeklyTitle = getTitle;
    weeklyDescription = getDesc;
    weeklyMont = getMonth;
    weeklyWeek = getWeek;
  }

  addMonthly() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('monthlyTitle', monthlyTitleList);
    prefs.setStringList("monthlyDescription", monthlyDescList);
    prefs.setStringList("monthlyMonth", monthlyMonthList);
  }

  getMonthly() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> getTitle = prefs.getStringList('monthlyTitle');
    List<String> getDesc = prefs.getStringList('monthlyDescription');
    List<String> getMonth = prefs.getStringList('monthlyMonth');
    monthlyTitle = getTitle;
    monthlyDescription = getDesc;
    monthlyMonth = getMonth;
    print(monthlyMonth);
  }
}
