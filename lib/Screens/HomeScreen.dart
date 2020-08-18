import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:task_management/Screens/Dropdown.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
  static const String id = "HomeScreen";
}

String dropdownValue = 'One';
String dropdownValue2 = '1.Hafta';

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text("Task Management",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        )),
                    background: Image.network(
                      "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                      fit: BoxFit.cover,
                    )),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    labelColor: Colors.black87,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(icon: Icon(Icons.assignment), text: "Daily"),
                      Tab(icon: Icon(Icons.date_range), text: "Weekly"),
                      Tab(icon: Icon(Icons.clear_all), text: "Monthly"),
                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            children: [
              Icon(Icons.directions_car),
              Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: FloatingActionButton(
                        onPressed: () {
                          //Navigator.pushNamed(context, AddScreen.id);
                          Alert(
                            context: context,
                            type: AlertType.success,
                            title: "Emin Misiniz?",
                            desc:"Haftalık görev eklemesi yapınız",
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
                                ),
                                TextField(
                                  maxLines: 2,
                                  decoration: InputDecoration(
                                    icon: Icon(Icons.description),
                                    labelText: 'Description',
                                  ),
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
                              ),
                            ],
                          ).show();
                        },
                        child: Icon(Icons.add),
                      ),
                    ),
                  ),
                ],
              ),
              Icon(Icons.directions_transit),
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
