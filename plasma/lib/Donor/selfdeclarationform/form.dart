import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:plasma/Donor/Authenticate1.dart';
import 'package:plasma/Donor/SignIn1.dart';
import 'package:signature/signature.dart';

int _value = 0;
int _value1 = 0;
int _value2 = 0;
int _value3 = 0;
int _value4 = 0;
int _value5 = 0;
int _value6 = 0;

class Form1 extends StatefulWidget {
  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<Form1> {
  final formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _pwd = TextEditingController();
  TextEditingController _pwd1 = TextEditingController();
  TextEditingController _exp = TextEditingController();
  TextEditingController _fee = TextEditingController();
  TextEditingController _fee1 = TextEditingController();
  TextEditingController _fee2 = TextEditingController();
  TextEditingController _fee3 = TextEditingController();
  TextEditingController _fee4 = TextEditingController();

  final SignatureController _controller =
      SignatureController(penStrokeWidth: 5, penColor: Colors.blue);
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      print("Value Changed");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Consent Form",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
                    child: Container(
                      color: Colors.white10,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: TextFormField(
                          controller: _name,
                          validator: (val) {
                            return val.isEmpty || val.length < 4
                                ? "Fullname is too short"
                                : null;
                          },
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "Fullname",
                            hintStyle: TextStyle(color: Colors.black54),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Container(
                      color: Colors.white10,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: TextFormField(
                          controller: _email,
                          validator: (val) {
                            return val.isEmpty ? "Mandatory Field*" : null;
                          },
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "Gender",
                            hintStyle: TextStyle(color: Colors.black54),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Container(
                      color: Colors.white10,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: TextFormField(
                          controller: _pwd,
                          validator: (val) {
                            return val.isEmpty ? "Mandatory Field*" : null;
                          },
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "Date of Birth",
                            hintStyle: TextStyle(color: Colors.black54),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Container(
                      color: Colors.white10,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: TextFormField(
                          controller: _pwd1,
                          validator: (val) {
                            return val.isEmpty ? "Mandatory Field" : null;
                          },
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "Age",
                            hintStyle: TextStyle(color: Colors.black54),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Container(
                      color: Colors.white10,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: TextFormField(
                          validator: (val) {
                            return val.isEmpty ? "Mandatory Field" : null;
                          },
                          controller: _exp,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "Father's Name",
                            hintStyle: TextStyle(color: Colors.black54),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Container(
                      color: Colors.white10,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: TextFormField(
                          validator: (val) {
                            return val.isEmpty ? "Mandatory Field" : null;
                          },
                          controller: _fee,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "Occupation",
                            hintStyle: TextStyle(color: Colors.black54),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Container(
                      color: Colors.white10,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: TextFormField(
                          validator: (val) {
                            return val.isEmpty ? "Mandatory Field" : null;
                          },
                          controller: _fee1,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "Organization",
                            hintStyle: TextStyle(color: Colors.black54),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Container(
                      color: Colors.white10,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: TextFormField(
                          validator: (val) {
                            return val.isEmpty ? "Mandatory Field" : null;
                          },
                          controller: _fee2,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "Address for Communication",
                            hintStyle: TextStyle(color: Colors.black54),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Container(
                      color: Colors.white10,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: TextFormField(
                          validator: (val) {
                            return val.isEmpty ? "Mandatory Field" : null;
                          },
                          controller: _fee3,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "Moible No",
                            hintStyle: TextStyle(color: Colors.black54),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton(
                        icon: Icon(Icons.arrow_drop_down),
                        value: _value,
                        items: [
                          DropdownMenuItem(
                            child: Text(
                              "Have you any reason to believe that you may be\n infected by either Hepatitis ,Malaria etc ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            value: 0,
                          ),
                          DropdownMenuItem(
                            child: Text("Yes"),
                            value: 1,
                          ),
                          DropdownMenuItem(
                            child: Text("No"),
                            value: 2,
                          )
                        ],
                        onChanged: (value) {
                          setState(() {
                            _value = value;
                          });
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton(
                        icon: Icon(Icons.arrow_drop_down),
                        value: _value1,
                        items: [
                          DropdownMenuItem(
                            child: Text(
                              "In the last 6 month have you had any\nhistory of the following",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            value: 0,
                          ),
                          DropdownMenuItem(
                            child: Text("Unexplained weight loss"),
                            value: 1,
                          ),
                          DropdownMenuItem(
                            child: Text("Repeated Dirrhoea"),
                            value: 2,
                          ),
                          DropdownMenuItem(
                            child: Text("Swollen glands"),
                            value: 3,
                          ),
                          DropdownMenuItem(
                            child: Text("Continuos low-grade fever"),
                            value: 4,
                          )
                        ],
                        onChanged: (value) {
                          setState(() {
                            _value1 = value;
                          });
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton(
                        icon: Icon(Icons.arrow_drop_down),
                        value: _value2,
                        items: [
                          DropdownMenuItem(
                            child: Text(
                              "In the last 6 month have you had any:-",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            value: 0,
                          ),
                          DropdownMenuItem(
                            child: Text("Tattooing"),
                            value: 1,
                          ),
                          DropdownMenuItem(
                            child: Text("Ear Piercing"),
                            value: 2,
                          ),
                          DropdownMenuItem(
                            child: Text("Dental Extraction"),
                            value: 3,
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _value2 = value;
                          });
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton(
                        icon: Icon(Icons.arrow_drop_down),
                        value: _value3,
                        items: [
                          DropdownMenuItem(
                            child: Text(
                              "Do you suffer from or have suffered\nfrom any of the following disease",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            value: 0,
                          ),
                          DropdownMenuItem(
                            child: Text("Heart Disease"),
                            value: 1,
                          ),
                          DropdownMenuItem(
                            child: Text("Lung Disease"),
                            value: 2,
                          ),
                          DropdownMenuItem(
                            child: Text("Diabetes"),
                            value: 3,
                          ),
                          DropdownMenuItem(
                            child: Text("Malaria(6 months)"),
                            value: 4,
                          )
                        ],
                        onChanged: (value) {
                          setState(() {
                            _value3 = value;
                          });
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton(
                        icon: Icon(Icons.arrow_drop_down),
                        value: _value4,
                        items: [
                          DropdownMenuItem(
                            child: Text(
                              "Are you taking or have taken\nany of these in past 72 hrs",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            value: 0,
                          ),
                          DropdownMenuItem(
                            child: Text("Antibiotics"),
                            value: 1,
                          ),
                          DropdownMenuItem(
                            child: Text("Steroids"),
                            value: 2,
                          ),
                          DropdownMenuItem(
                            child: Text("Aspirin"),
                            value: 3,
                          ),
                          DropdownMenuItem(
                            child: Text("Alcohol"),
                            value: 4,
                          ),
                          DropdownMenuItem(
                            child: Text("Vaccinations"),
                            value: 5,
                          )
                        ],
                        onChanged: (value) {
                          setState(() {
                            _value4 = value;
                          });
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton(
                        icon: Icon(Icons.arrow_drop_down),
                        value: _value5,
                        items: [
                          DropdownMenuItem(
                            child: Text(
                              "Is there any history of surgery or\nblood transfusion in the past 6 months?",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            value: 0,
                          ),
                          DropdownMenuItem(
                            child: Text("Major"),
                            value: 1,
                          ),
                          DropdownMenuItem(
                            child: Text("Minor"),
                            value: 2,
                          ),
                          DropdownMenuItem(
                            child: Text("Blood Transfusion"),
                            value: 3,
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _value5 = value;
                          });
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton(
                        icon: Icon(Icons.arrow_drop_down),
                        value: _value6,
                        items: [
                          DropdownMenuItem(
                            child: Text(
                              "For women donors?",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            value: 0,
                          ),
                          DropdownMenuItem(
                            child: Text("Pregnant"),
                            value: 1,
                          ),
                          DropdownMenuItem(
                            child: Text("had an abortion in last 3 months"),
                            value: 2,
                          ),
                          DropdownMenuItem(
                            child: Text("have a child less them one year old"),
                            value: 3,
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _value6 = value;
                          });
                        }),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "I understand that",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "(a) blood donation is a totally voluntary act and no inducemnet or renumeration has been offered.",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "(b) donation of blood/componnents is medical procedure and that by donating voluntarily.Iaccept the risk associated with this procedure.",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "I prohibit any information provided by me or about my donation to be disclosed to any individual or government agency without my prior concerns",
              ),
            ),
            Signature(
              controller: _controller,
              height: 300,
              backgroundColor: Colors.transparent,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.black),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.check,
                        color: Colors.blue,
                      ),
                      onPressed: () async {
                        if (_controller.isNotEmpty) {
                          var data = await _controller.toPngBytes();
                          if (formkey.currentState.validate()) {
                            formkey.currentState.save();

                            setState(() {
                              _value = 0;
                              _value1 = 0;
                              _value2 = 0;
                              _value3 = 0;
                              _value4 = 0;
                              _value5 = 0;
                              _value6 = 0;
                              _controller.clear();
                              _name.clear();
                              _email.clear();
                              _pwd.clear();
                              _pwd1.clear();
                              _exp.clear();
                              _fee.clear();
                              _fee1.clear();
                              _fee2.clear();
                              _fee3.clear();
                              _fee4.clear();
                            });
                          }
                        }
                        showDialog(
                            context: context,
                            builder: (context) {
                              Future.delayed(Duration(seconds: 3), () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Authenticate1()));
                              });
                              return DelayedDisplay(
                                slidingCurve: Curves.easeIn,
                                delay: Duration(seconds: 2),
                                child: AlertDialog(
                                  content: Text(
                                    "Donor Verified !",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              );
                            });
                      }),
                  IconButton(
                      icon: Icon(
                        Icons.clear,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        setState(() {
                          _controller.clear();
                          _name.clear();
                          _email.clear();
                          _pwd.clear();
                          _pwd1.clear();
                          _exp.clear();
                          _fee.clear();
                          _fee1.clear();
                          _fee2.clear();
                          _fee3.clear();
                          _fee4.clear();
                          _value = 0;
                          _value1 = 0;
                          _value2 = 0;
                          _value3 = 0;
                          _value4 = 0;
                          _value5 = 0;
                          _value6 = 0;
                        });
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
