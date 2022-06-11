import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_manager/models/mockTask.dart';

Widget todayTaskContainer(double vh, double vw, List<MockTask> _taskList) {
  return Expanded(
    child: Container(
      height: vh * 0.9,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(0), topLeft: Radius.circular(0)),
      ),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: _taskList.length,
        itemBuilder: (context, index) {
          final taskItem = _taskList[index];

          return CupertinoContextMenu(
              previewBuilder: ((context, animation, child) =>
                  Expanded(child: buildTaskCard(vh, vw, taskItem))),
              actions: const <Widget>[
                CupertinoContextMenuAction(
                  child: Text("Expand",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
                  trailingIcon: CupertinoIcons.arrow_up_left_arrow_down_right,
                  isDestructiveAction: false,
                ),
                CupertinoContextMenuAction(
                  child: Text("Edit",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
                  trailingIcon: CupertinoIcons.pencil,
                  isDestructiveAction: false,
                ),
                CupertinoContextMenuAction(
                  child: Text("Delete",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
                  trailingIcon: CupertinoIcons.delete,
                  isDestructiveAction: true,
                )
              ],
              child: buildTaskCard(vh, vw, taskItem));
        },
      ),
    ),
  );
}

Widget buildTaskCard(double vh, double vw, taskItem) {
  return Padding(
      padding: EdgeInsets.only(bottom: 20, left: 10, right: 10),
      child: Container(
        height: vh * 0.2,
        width: vw * 0.8,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                offset: Offset(
                  -6.0,
                  7.0,
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
            ],
            color: Colors.orangeAccent.shade200),
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
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
                          child: Text("Polestar Consid",
                              textScaleFactor: 1,
                              style: GoogleFonts.manrope(
                                fontWeight: FontWeight.w700,
                              ))),
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
                                fontWeight: FontWeight.w700, fontSize: 12))),
                  ),
                ],
              ),
              Row(children: [
                const SizedBox(width: 15),
                Text(taskItem.title,
                    textScaleFactor: 1.2,
                    style: GoogleFonts.manrope(fontWeight: FontWeight.bold)),
              ]),
              Row(
                children: [
                  SizedBox(width: 15),
                  Icon(CupertinoIcons.calendar, size: 18),
                  SizedBox(width: 10),
                  Text(taskItem.deadline.toString(),
                      style: GoogleFonts.manrope(fontWeight: FontWeight.w600))
                ],
              ),
              Row(
                children: [
                  const SizedBox(width: 15),
                  const Icon(CupertinoIcons.time, size: 18),
                  const SizedBox(width: 10),
                  Text("07:10",
                      style: GoogleFonts.manrope(fontWeight: FontWeight.w600))
                ],
              ),
              SizedBox(height: 10)
            ]),
      ));
}
