import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plasma/Screen/donate.dart';
import 'package:plasma/Screen/feed.dart';
import 'package:plasma/Screen/profile.dart';
import 'package:plasma/Screen/request.dart';

class Bottom extends StatefulWidget {
  @override
  _BottomState createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int index = 0;
  void tapped(int index1) {
    setState(() {
      index = index1;
    });
  }

  /* Future read() async {
    FirebaseDatabase.instance
        .reference()
        .child("Users")
        .child(uid1)
        .once()
        .then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values;
      values = snapshot.value;

      values.forEach((key, value) {
        //
        FirebaseDatabase.instance
            .reference()
            .child("Users")
            .child(uid1)
            .child("username")
            .once()
            .then((DataSnapshot s) {
          globalname = s.value;
        });
      });
      values.forEach((key, value) {
        //
        FirebaseDatabase.instance
            .reference()
            .child("Users")
            .child(uid1)
            .child("image")
            .once()
            .then((DataSnapshot s) {
          globalimage = s.value;
        });
      });
    });
  }*/

  @override
  void initState() {
    super.initState();
    //read();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widget1 = [
      Feed(),
      Request(),
      Donate(),
      Profile(),
      Profile(),
    ];

    return Scaffold(
      body: widget1.elementAt(index),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color(0xFF222222),
        ),
        child: BottomNavigationBar(
            showSelectedLabels: true,
            unselectedItemColor: Colors.white70,
            showUnselectedLabels: true,
            elevation: 18,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white,
            currentIndex: index,
            onTap: tapped,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), title: Text("Feed")),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.search), title: Text("Search")),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.handsHelping),
                  title: Text("Donate")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), title: Text("Profile")),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.infoCircle), title: Text("FAQ")),
            ]),
      ),
    );
  }
}
