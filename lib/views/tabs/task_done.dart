import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_manager/models/mockTask.dart';

Widget taskDoneContainer(double vh, double vw, List<Object> _taskList) {
  return Expanded(
    child: Container(
      height: vh * 0.85,
      width: vw,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(0), topLeft: Radius.circular(0)),
      ),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: _taskList.length,
        itemBuilder: (context, index) {
          final taskItem = _taskList[index];

          return Padding(
              padding: EdgeInsets.only(bottom: 20, left: 10, right: 10),
              child: Container(
                height: vh * 0.2,
                width: vw * 0.6,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(
                          -4.0,
                          3.0,
                        ),
                        blurRadius: 0.0,
                        spreadRadius: 1.0,
                      ), //BoxShadow
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ), //BoxShadow
                    ],
                    color: Colors.greenAccent.shade200),
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //SizedBox(width: 10),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              decoration: BoxDecoration(
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
                              child: Padding(
                                  padding: EdgeInsets.all(7),
                                  child: Text("Education",
                                      style: GoogleFonts.manrope(
                                          fontWeight: FontWeight.w700))),
                            ),
                          ),
                          // SizedBox(width: 10),
                          Container(
                            decoration: BoxDecoration(
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
                            child: Padding(
                                padding: EdgeInsets.all(7),
                                child: Text("Education",
                                    style: GoogleFonts.manrope(
                                        fontWeight: FontWeight.w700))),
                          ),
                        ],
                      ),
                      Row(children: [
                        SizedBox(width: 15),
                        Text("taskItem.title",
                            textScaleFactor: 1.2,
                            style: GoogleFonts.manrope(
                                fontWeight: FontWeight.bold)),
                      ]),
                      Row(
                        children: [
                          SizedBox(width: 15),
                          Icon(CupertinoIcons.calendar, size: 18),
                          SizedBox(width: 10),
                          Text("taskItem.deadline.toString()",
                              style: GoogleFonts.manrope(
                                  fontWeight: FontWeight.w600))
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 15),
                          Icon(CupertinoIcons.time, size: 18),
                          SizedBox(width: 10),
                          Text("07:10",
                              style: GoogleFonts.manrope(
                                  fontWeight: FontWeight.w600))
                        ],
                      ),
                      SizedBox(height: 10)
                    ]),
              ));
        },
      ),
    ),
  );
}
