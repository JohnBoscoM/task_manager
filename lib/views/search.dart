import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with TickerProviderStateMixin {

  final searchController = TextEditingController();
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    // getAllUserTasks();
  }


  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery
        .of(context)
        .size
        .height;
    var _width = MediaQuery
        .of(context)
        .size
        .width;
    // final effectKey = RippleEffect.createGlobalKey();
    return SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:[
              Container(
                decoration: BoxDecoration(
                  // boxShadow: BoxShadow(
                  //   offset: 1
                  // )
                  borderRadius: BorderRadius.circular(20)
                ),
                width: _width * 0.9,
                
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(),
                  style: GoogleFonts.manrope(
                      fontSize: 18, fontWeight: FontWeight.w700),
                ),
              )
            ],
          ),
        ));
  }
}
