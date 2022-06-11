import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_manager/models/task.dart';
import 'package:task_manager/views/calendar.dart';
import 'package:task_manager/views/tabs/task_done.dart';
import 'package:task_manager/views/tabs/today_task.dart';
import 'package:task_manager/views/tabs/upcoming_task.dart';

import '../models/mockTask.dart';

class TodoPage extends StatefulWidget {
  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> with TickerProviderStateMixin {
  String welcome_text = "";
  late TabController _tabcontroller;
  List<Object>? _taskList;

  int _selectedIndex = 0;
  MockTask task1 = new MockTask("Publish Flutter App", new DateTime.now(),
      ["Hobby", "Education"], Urgency.low);
  MockTask task2 = new MockTask("Publish Flutter App", new DateTime.now(),
      ["Hobby", "Education"], Urgency.low);
  MockTask task3 = new MockTask("Publish Flutter App", new DateTime.now(),
      ["Hobby", "Education"], Urgency.low);
  List<MockTask> list = [];

  List<Widget> tablist = [
    Tab(text: "Todo" + "(3)"),
    Tab(text: "In Progress" + "(3)"),
    Tab(text: "Done" + "(3)"),
  ];

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    getAllUserTasks();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    list.add(task1);
    list.add(task2);
    list.add(task3);
    // Create TabController for getting the index of current tab
    _tabcontroller = TabController(length: tablist.length, vsync: this);
    _tabcontroller.addListener(() {
      setState(() {
        _selectedIndex = _tabcontroller.index;
      });
      print("Selected Index: " + _tabcontroller.index.toString());
    });
  }

  Future getAllUserTasks() async {
    var data = await FirebaseFirestore.instance
        .collection("Task")
        .orderBy("DueDate", descending: false)
        .get();

    setState(() {
      _taskList = List.from(data.docs.map((doc) => Task.fromSnapshot(doc)));
    });
  }

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return DefaultTabController(
        length: 3,
        child: SafeArea(
            child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black38),
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text("Board",
                style: GoogleFonts.manrope(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w600)),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(CupertinoIcons.calendar,
                  color: Colors.black, size: 30),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CalendarPage()));
              },
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  CupertinoIcons.bell,
                  color: Colors.black,
                  size: 30,
                ),
                onPressed: () {},
              ),
              // IconButton(
              //   icon: const Icon(
              //     CupertinoIcons.moon,
              //     color: Colors.black26,
              //     size: 30,
              //   ),
              //   onPressed: () {},
              // ),
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 20, top: 20, bottom: 10),
                  child: Text(
                    "Welcome Bosco!",
                    textScaleFactor: 1.4,
                    style: GoogleFonts.manrope(
                        color: Colors.black, fontWeight: FontWeight.w400),
                  )),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Padding(
                    padding: EdgeInsets.only(left: 20, bottom: 30),
                    child: Text(
                      "This is your board.",
                      textScaleFactor: 1.7,
                      style: GoogleFonts.manrope(
                          color: Colors.black, fontWeight: FontWeight.w700),
                    )),
                Padding(
                    padding: EdgeInsets.only(right: 20, bottom: 30),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(60)),
                      child: IconButton(
                        icon: const Icon(CupertinoIcons.search,
                            color: Colors.white, size: 30),
                        onPressed: () {},
                      ),
                    ))
              ]),
              Center(
                  child: Container(
                      height: _height * 0.04,
                      width: _width * 0.95,
                      child: TabBar(
                          controller: _tabcontroller,
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.black,
                          labelStyle: GoogleFonts.manrope(
                              color: Colors.black, fontWeight: FontWeight.w600),
                          unselectedLabelStyle: GoogleFonts.manrope(
                              color: Colors.black, fontWeight: FontWeight.w600),
                          indicator: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(0),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  offset: Offset(
                                    -3.0,
                                    4.0,
                                  ),
                                  blurRadius: 0.0,
                                  spreadRadius: 1.0,
                                ), //BoxShadow
                                BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(0.0, 0.0),
                                  blurRadius: 0.0,
                                  spreadRadius: 0.0,
                                ),
                                //BoxShadow
                              ]),
                          tabs: tablist))),
              Padding(
                padding: EdgeInsets.all(20),
                child: Expanded(
                  child: Container(
                    height: _height * 0.603,
                    width: _width * _width * 0.6,
                    child: TabBarView(
                      controller: _tabcontroller,
                      children: [
                        todayTaskContainer(_height, _width, list),
                        upcomingTaskContainer(_height, _width, list),
                        taskDoneContainer(_height, _width, list),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )));
  }
}
