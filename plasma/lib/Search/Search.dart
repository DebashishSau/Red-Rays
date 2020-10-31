import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:plasma/global.dart';

int _value = 0;
int _value1 = 0;
String blood;
String location;
bool check = false;
DatabaseReference database1;

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
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
                            onTap: () {
                              setState(() {
                                check = false;
                              });
                            },
                            elevation: 0,
                            onChanged: (value) {
                              setState(() {
                                _value1 = value;
                                if (_value1 == 1) {
                                  blood = "A+";
                                }
                                if (_value1 == 2) {
                                  blood = "B+";
                                  print(blood);
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
                                child:
                                    Center(child: Text("Select Blood Group")),
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
                            onTap: () {
                              setState(() {
                                check = false;
                              });
                            },
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
                      onTap: () async {
                        database1 = FirebaseDatabase.instance
                            .reference()
                            .child("Consentform")
                            .child(blood)
                            .child(location);
                        if (database1 != null) {
                          setState(() {
                            check = true;
                          });
                        }
                      },
                      child: Container(
                        height: 40,
                        width: 200,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Center(
                          child: Text("SEARCH"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              if (check == true)
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.5,
                  child: FirebaseAnimatedList(
                      sort: (a, b) => (b.key.compareTo(a.key)),
                      defaultChild: Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                        ),
                      ),
                      query: database1,
                      itemBuilder: (_, DataSnapshot snapshot,
                          Animation<double> animation, int index) {
                        return FutureBuilder<DataSnapshot>(
                            future: database1
                                .reference()
                                .child(snapshot.key)
                                .once(),
                            builder: (context, snapshot1) {
                              return snapshot1.hasData
                                  ? Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      elevation: 15,
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.3,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                8,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: CircleAvatar(
                                                radius: 30,
                                                backgroundColor:
                                                    Colors.transparent,
                                                backgroundImage: NetworkImage(
                                                    snapshot1
                                                        .data.value['image']),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 30,
                                            ),
                                            Text(
                                              snapshot1.data.value['fullname'],
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  : Container(
                                      child: Center(
                                        child: Text("No result"),
                                      ),
                                    );
                            });
                      }),
                ),
              if (check == false) Container()
            ],
          ),
        ),
      ),
    );
  }
}
