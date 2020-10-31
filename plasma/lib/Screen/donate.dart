import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plasma/global.dart';
import 'package:uuid/uuid.dart';

DatabaseReference database;
bool k = false;
final databaseReference = FirebaseDatabase.instance.reference();
String abc;
bool f = false;
final picker = ImagePicker();
String downloadurl;
String downloadurl1;
File image2;
var uid = Uuid();

class Donate extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Donate> {
  TextEditingController posttext = TextEditingController();
  final formkey = GlobalKey<FormState>();

  Future<String> add(
      String posttext, String image, String name, String check) async {
    var uuid = new Uuid().v1();
    DatabaseReference _color2 = databaseReference.child("Request").child(uuid);
    final TransactionResult transactionResult =
        await _color2.runTransaction((MutableData mutableData) async {
      mutableData.value = (mutableData.value ?? 0) + 1;

      return mutableData;
    });
    if (transactionResult.committed) {
      _color2.push().set(<String, String>{
        "image": "true",
        "username": "true",
        "request": "true",
        "report": "true",
        "check": "true",
        "uid": "true"
      }).then((_) {
        print('Transaction  committed.');

        abc = "success";
      });
    } else {
      print('Transaction not committed.');
      if (transactionResult.error != null) {
        print(transactionResult.error.message);
      }
    }
    _color2.set({
      "image": image,
      "username": name,
      "request": posttext,
      "report": downloadurl1,
      "check": check,
      "uid": uuid
    });

    return abc;
  }

  Future uploadToStorage1() async {
    try {
      final DateTime now = DateTime.now();
      final int millSeconds = now.millisecondsSinceEpoch;
      final String month = now.month.toString();
      final String date = now.day.toString();
      final String storageId = (millSeconds.toString() + uid.toString());
      final String today = ('$month-$date');

      final file = await picker.getImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );
      image2 = File(file.path);
      uploadVideo1(image2);
    } catch (error) {
      print(error);
    }
  }

  Future<String> uploadVideo1(var videofile) async {
    var uuid = new Uuid().v1();
    StorageReference ref =
        FirebaseStorage.instance.ref().child("post_$uuid.jpg");

    await ref.putFile(videofile).onComplete.then((val) {
      val.ref.getDownloadURL().then((val) {
        print(val);
        downloadurl1 = val;
        // add(downloadurl); //Val here is Already String
      });
    });
    return downloadurl1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFC0CB),
        body: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(globalimage),
                        radius: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        globalname,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 28),
                      ),
                    ],
                  ),
                ),
                Card(
                  color: Colors.transparent,
                  elevation: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    width: 400,
                    height: 500,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: TextFormField(
                          validator: (val) {
                            return val.length > 79
                                ? null
                                : "Text Should be of minimun 100 letters";
                          },
                          controller: posttext,
                          maxLines: null,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.multiline,
                          enableSuggestions: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Share your requirements",
                              hintStyle: TextStyle(
                                  color: Colors.black87, fontSize: 20)),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    width: 400,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 38,
                          ),
                          Text(
                            "Upload the diagnostic/medical proof",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          GestureDetector(
                            onTap: () {
                              uploadToStorage1().then((value) {
                                setState(() {
                                  f = true;
                                });
                              });
                            },
                            child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                child: f == false
                                    ? Icon(
                                        Icons.attach_file,
                                        color: Colors.black,
                                      )
                                    : Icon(
                                        Icons.check,
                                        color: Colors.green,
                                      )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    width: 200,
                    child: RaisedButton(
                        color: Colors.white70,
                        elevation: 0,
                        child: Center(
                          child: Text(
                            "POST",
                            style: TextStyle(
                                color: Colors.black,
                                letterSpacing: 3,
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        onPressed: () {
                          if (formkey.currentState.validate()) {
                            formkey.currentState.save();
                            add(posttext.text, globalimage, globalname,
                                "false");
                            posttext.clear();
                            setState(() {
                              f = false;
                            });
                          }
                        }),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
