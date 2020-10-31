import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final List<String> _dropdownValues1 = [
    "A",
    "A+",
    "B",
    "B+",
    "O+",
    "O-",
    "AB"
  ];

  final List<String> _dropdownValues = [
    "Chennai",
    "Pune",
    "Delhi",
    "Mumbai",
    "Lucknow"
  ];
  _displayDialog1(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Blood Group'),
            content: DropdownButton(
              items: _dropdownValues1
                  .map((value) => DropdownMenuItem(
                        child: Text(value),
                        value: value,
                      ))
                  .toList(),
              onChanged: (String value) {},
              isExpanded: false,
              hint: Text('Select Blood Group'),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Location'),
            content: DropdownButton(
              items: _dropdownValues
                  .map((value) => DropdownMenuItem(
                        child: Text(value),
                        value: value,
                      ))
                  .toList(),
              onChanged: (String value) {},
              isExpanded: false,
              hint: Text('Select City'),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
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
                  GestureDetector(
                    onTap: () {
                      _displayDialog1(context);
                    },
                    child: Container(
                      height: 40,
                      width: 400,
                      child: Center(child: Text('Select Blood Group')),
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      _displayDialog(context);
                    },
                    child: Container(
                      height: 40,
                      width: 400,
                      child: Center(child: Text('Select Location')),
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 40,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Center(
                      child: Text("SEARCH"),
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
