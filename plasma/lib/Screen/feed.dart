import 'dart:ui';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:plasma/Comments/comment.dart';
import 'package:plasma/Screen/chat.dart';
import 'package:plasma/readmore/fullpost.dart';

import '../global.dart';

DatabaseReference database1;
bool check3 = false;
String image;
String comment;

class Feed extends StatefulWidget {
  @override
  _BlogsState createState() => _BlogsState();
}

class _BlogsState extends State<Feed> {
  @override
  void initState() {
    super.initState();
    database1 = FirebaseDatabase.instance.reference().child("Request");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
          child: Text(
            "REQUESTS",
            style: TextStyle(
                color: Colors.black,
                letterSpacing: 20,
                fontSize: 25,
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
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
                      future: database1.reference().child(snapshot.key).once(),
                      builder: (context, snapshot1) {
                        return snapshot1.hasData
                            ? Hero(
                                tag: index,
                                child: Center(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                    child: GestureDetector(
                                      onLongPress: () {
                                        setState(() {
                                          check3 = true;
                                          image = snapshot1.data.value['image'];
                                          comment = snapshot1.data.value['uid'];
                                        });
                                      },
                                      onLongPressEnd: (details) {
                                        setState(() {
                                          check3 = false;
                                        });
                                      },
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        elevation: 10,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Color(0xFFFFC0CB),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    CircleAvatar(
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      backgroundImage:
                                                          NetworkImage(snapshot1
                                                              .data
                                                              .value['image']),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          10, 10, 20, 5),
                                                      child: Center(
                                                        child: Text(
                                                          snapshot1.data.value[
                                                              'username'],
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black87,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                              letterSpacing: 3,
                                                              fontSize: 20),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        10, 0, 5, 0),
                                                child: Text(
                                                  snapshot1
                                                      .data.value['request'],
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 16),
                                                ),
                                              ),
                                              Container(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 10, 0, 10),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          if (snapshot1.data
                                                                      .value[
                                                                  'check'] !=
                                                              "false") {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            Chat()));
                                                          }
                                                        },
                                                        child: Icon(
                                                          Icons.call,
                                                          color: snapshot1.data
                                                                          .value[
                                                                      'check'] ==
                                                                  "false"
                                                              ? Colors.black
                                                              : Colors.green,
                                                          size: 30,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 100,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          Comment1(
                                                                            comment1:
                                                                                snapshot1.data.value['uid'],
                                                                          )));
                                                        },
                                                        child: Icon(
                                                          Icons.insert_comment,
                                                          color: Colors.black,
                                                          size: 30,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 100,
                                                      ),
                                                      Icon(
                                                        MdiIcons.share,
                                                        color: Colors.black,
                                                        size: 30,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container();
                      },
                    );
                  })),
          /* if (check3) ...[
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5.0,
                sigmaY: 5.0,
              ),
              child: Container(
                color: Colors.white.withOpacity(0.6),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width / 1.2,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            alignment: Alignment.center,
                            image: NetworkImage(image),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Icon(
                      MdiIcons.heart,
                      color: Colors.red,
                      size: 30,
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          check3 = false;
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Comment1(comment1: comment)));
                      },
                      child: Icon(
                        Icons.insert_comment,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    Icon(
                      MdiIcons.share,
                      color: Colors.black,
                      size: 30,
                    )
                  ])
                ],
              ),
            ),
          ]*/
        ],
      ),
    );
  }
}
