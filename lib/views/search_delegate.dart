import 'package:flutter/material.dart';

class Search extends SearchDelegate{
  String selectedResult ="";
  List<String> recentList = ["MongoDB", "AWS"];
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return <Widget>[IconButton(
      icon: const Icon(Icons.close,
          color: Colors.black, size: 30),
      onPressed: () {
        //Navigator.push(context,MaterialPageRoute(builder: (context)=> CalendarPage()));
      },
    ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    <Widget>[IconButton(
      icon: const Icon(Icons.arrow_back,
          color: Colors.black, size: 30),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    ];
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container(
      child: Center(
        child: Text(selectedResult)
      )
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
   // List<String> suggestionList = [];
   // query.isEmpty ? suggestionList = recentList
    return Container();
  }
  
}