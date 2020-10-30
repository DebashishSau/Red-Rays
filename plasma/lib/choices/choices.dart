import 'package:flutter/material.dart';
import 'package:plasma/Donor/Authenticate1.dart';
import 'package:plasma/GoogleAuth/Login%20and%20signup/Authenticate.dart';

class Choices extends StatefulWidget {
  @override
  _ChoicesState createState() => _ChoicesState();
}

class _ChoicesState extends State<Choices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
                child: Text("Patient"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Authenticate()));
                }),
            RaisedButton(
                child: Text("Donor"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Authenticate1()));
                })
          ],
        ),
      ),
    );
  }
}
