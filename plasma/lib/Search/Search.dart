import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:plasma/global.dart';

int _value = 0;
int _value1 = 0;
String blood;
String location;

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Future read() async {
    FirebaseDatabase.instance
        .reference()
        .child("Consentform")
        .child(blood)
        .child(location)
        .once()
        .then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values;
      values = snapshot.value;
      color.clear();
      values.forEach((key, value) {
        //
        FirebaseDatabase.instance
            .reference()
            .child("Consentform")
            .child(blood)
            .child(location)
            .child(key)
            .child("fullname")
            .once()
            .then((DataSnapshot s) {
          color.add(s.value);
        });
      });
      print(color);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              height: 450,
              width: 500,
              color: Color(0xFF9F000F),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/logo.png"))),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Search a\nDonor",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 30),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 40,
                    width: 400,
                    child: Center(
                      child: DropdownButton(
                          elevation: 0,
                          onChanged: (value) {
                            setState(() {
                              _value1 = value;
                              if (_value1 == 1) {
                                blood = "A+";
                              }
                              if (_value1 == 2) {
                                blood = "B+";
                              }
                              if (_value1 == 3) {
                                blood = "A";
                              }
                              if (_value1 == 4) {
                                blood = "B";
                              }
                              if (_value1 == 5) {
                                blood = "O+";
                              }
                              if (_value1 == 6) {
                                blood = "O-";
                              }
                              if (_value1 == 7) {
                                blood = "AB";
                              }
                            });
                          },
                          value: _value1,
                          items: [
                            DropdownMenuItem(
                              child: Center(child: Text("Select Blood Group")),
                              value: 0,
                            ),
                            DropdownMenuItem(
                              child: Center(child: Text("A+")),
                              value: 1,
                            ),
                            DropdownMenuItem(
                              child: Center(child: Text("B+")),
                              value: 2,
                            ),
                            DropdownMenuItem(
                              child: Center(child: Text("A")),
                              value: 3,
                            ),
                            DropdownMenuItem(
                              child: Center(child: Text("B")),
                              value: 4,
                            ),
                            DropdownMenuItem(
                              child: Center(child: Text("o+")),
                              value: 5,
                            ),
                            DropdownMenuItem(
                              child: Center(child: Text("o-")),
                              value: 6,
                            ),
                            DropdownMenuItem(
                              child: Center(child: Text("AB")),
                              value: 7,
                            )
                          ]),
                    ),
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 40,
                    width: 400,
                    child: Center(
                      child: DropdownButton(
                          elevation: 0,
                          onChanged: (value) {
                            setState(() {
                              _value = value;
                              if (_value == 1) {
                                location = "Lucknow";
                              }
                              if (_value == 2) {
                                location = "Delhi";
                              }
                              if (_value == 3) {
                                location = "Chennai";
                              }
                            });
                          },
                          value: _value,
                          items: [
                            DropdownMenuItem(
                              child: Text("Select Location"),
                              value: 0,
                            ),
                            DropdownMenuItem(
                              child: Text("Lucknow"),
                              value: 1,
                            ),
                            DropdownMenuItem(
                              child: Text("Delhi"),
                              value: 2,
                            ),
                            DropdownMenuItem(
                              child: Text("Chennai"),
                              value: 3,
                            )
                          ]),
                    ),
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      read();
                    },
                    child: Container(
                      height: 40,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                        child: Text("SEARCH"),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
