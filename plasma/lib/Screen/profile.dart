import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/logo.png"), fit: BoxFit.cover)),
            ),
            SizedBox(
              width: 30,
            ),
            Text(
              "Profile",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1),
            ),
          ],
        ),
      ),
      body: Container(
        width: 500,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/pp.jpg"), fit: BoxFit.cover)),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "USERNAME",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "AGE: ",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  "23",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  " | ",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  "GENDER: ",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  "MALE",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  " | ",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  "WEIGHT: ",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  "72KG",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Contact Details: +918383828287",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "abc@gmail.com",
              style: TextStyle(color: Colors.blue[600]),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 400,
              decoration: BoxDecoration(
                  color: Colors.blue[900],
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      "DONOR / RECIEVER",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "BLOOD GROUP: ",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          "O+",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w900),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
