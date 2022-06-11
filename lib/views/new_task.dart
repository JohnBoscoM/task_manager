import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewTaskPage extends StatefulWidget {
  @override
  _NewTaskPageState createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage>
    with SingleTickerProviderStateMixin {
  int _value = 1;
  bool isSubmitted = false;
  final checkBoxIcon = 'assets/checkbox.svg';
  final titleController = TextEditingController();
  final costController = TextEditingController();
  final deadlineController = TextEditingController();
  DateTime _date = DateTime.now();
  Future<Null> _selectDate(BuildContext context) async {
    DateTime? datePicker = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(1900),
        lastDate: DateTime(3000));
    if (datePicker != null && datePicker != _date) {
      setState(() {
        _date = datePicker;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var scrWidth = MediaQuery.of(context).size.width;
    var scrHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("Create Task",
              style: GoogleFonts.manrope(fontWeight: FontWeight.w700)),
          centerTitle: true,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          physics: PageScrollPhysics(),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  //
                  Column(
                    children: [
                   

                      //
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40, 0, 40, 15),
                        child: TextFormField(
                          //cursorColor: themeProvider.themeMode().textColor,
                          // obscureText: 'Title' == '' ? true : false,
                          // this can be changed based on usage -
                          // such as - onChanged or onFieldSubmitted
                          onChanged: (value) {
                            setState(() {
                              titleController.text = value;
                              isSubmitted = true;
                            });
                          },
                          style: TextStyle(
                              fontFamily: 'avenir',
                              fontSize: 19,
                              //  color: themeProvider.themeMode().textColor,
                              fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: "Enter here...",
                            hintStyle: TextStyle(
                                fontSize: 18,
                                //  color: themeProvider.themeMode().textColor,
                                fontWeight: FontWeight.w600),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 27, horizontal: 25),
                            focusColor: Colors.brown,
                            suffixIcon: isSubmitted == true
                                // will turn the visibility of the 'checkbox' icon
                                // ON or OFF based on the condition we set before
                                ? Visibility(
                                    visible: true,
                                    child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Container()),
                                  )
                                : Visibility(
                                    visible: false, child: Container()),
                          ),
                        ),
                      ),
                      //
                    ],
                  ),
                  //

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 50.0, bottom: 8),
                      child: Text('DEADLINE:',
                          style: GoogleFonts.manrope(
                              fontSize: 16, fontWeight: FontWeight.w400)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 0, 40, 15),
                    child: TextFormField(
                      readOnly: true,
                      // this can be changed based on usage -
                      // such as - onChanged or onFieldSubmitted
                      onTap: () {
                        setState(() {
                          _selectDate(context);
                        });
                      },
                      style: TextStyle(
                          fontSize: 19,
                          color: Colors.brown[700],
                          fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        hintText: _date.toString().substring(0, 10),
                        hintStyle: TextStyle(
                            fontFamily: 'avenir',
                            fontSize: 18,
                            // color: themeProvider.themeMode().textColor,
                            fontWeight: FontWeight.w600),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 27, horizontal: 25),
                        focusColor: Colors.brown[700],
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                          borderSide: BorderSide(color: Colors.brown.shade700),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                          borderSide: BorderSide(
                              // color: themeProvider.themeMode().borderColor,
                              ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50.0, bottom: 8),
                          child: Text(
                            'TAGS: ',
                            style: GoogleFonts.manrope(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      //
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40, 0, 40, 15),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          //  cursorColor: themeProvider.themeMode().textColor,
                          // obscureText: 'Title' == '' ? true : false,
                          // this can be changed based on usage -
                          // such as - onChanged or onFieldSubmitted
                          onChanged: (value) {
                            setState(() {
                              costController.text = value;
                              isSubmitted = true;
                            });
                          },
                          style: TextStyle(
                              fontFamily: 'avenir',
                              fontSize: 19,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            hintText: " Enter here...",
                            hintStyle: TextStyle(
                                fontSize: 18,
                                //   color: themeProvider.themeMode().textColor,
                                fontWeight: FontWeight.w600),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 27, horizontal: 25),
                            focusColor: Colors.brown,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0),
                              borderSide: BorderSide(),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0),
                              borderSide: BorderSide(
                                  //  color: themeProvider.themeMode().borderColor,
                                  ),
                            ),
                            suffixIcon: isSubmitted == true
                                // will turn the visibility of the 'checkbox' icon
                                // ON or OFF based on the condition we set before
                                ? Visibility(
                                    visible: true,
                                    child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Container()),
                                  )
                                : Visibility(
                                    visible: false, child: Container()),
                          ),
                        ),
                      ),
                      //
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  //
                  // CustomForms(
                  //   label: 'Due Date',
                  //   inputHint: new DateTime.now().toString().substring(0,10),
                  //   controller: deadlineController,
                  //   isDateForm: true,
                  // ),

                  //
                  SizedBox(
                    height: 20,
                  ),
                  
                  TextButton(
                    onPressed: () {},
                    child: Container(
                      margin: EdgeInsets.all(20),
                      width: scrWidth * 0.75,
                      height: 75,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(0),
                          
                            //BoxShadow
                          ),
                      child: const Center(
                        child: Text(
                          'Create Task',
                          style: TextStyle(
                            fontFamily: 'avenir',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
