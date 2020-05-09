import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:idcard_generator/idcard.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Confirmation extends StatefulWidget {
  final String nameCollege, nameStudent, dobValue, branch;
  final int rollNo, finishYear;
  final File idPhoto;
  Confirmation(
      {this.nameCollege,
      this.nameStudent,
      this.dobValue,
      this.branch,
      this.rollNo,
      this.finishYear,
      this.idPhoto});

  @override
  _ConfirmationState createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  String dobValue;

  getdate(str) {
    List date = str.toString().split('-');
    return '${date[2]}/${date[1]}/${date[0]}';
  }

  //firestore
  Future<void> firestoreAdd() async {
    final CollectionReference database =
        Firestore.instance.collection('Database');
    try {
      database.document(widget.rollNo.toString()).setData({
        'college_name': widget.nameCollege,
        'student_name': widget.nameStudent,
        'roll_no': widget.rollNo,
        'date_of_birth': dobValue,
        'branch': widget.branch,
        'validity': widget.finishYear,
      });
    } catch (e) {
      Alert(
        context: context,
        title: 'Error',
        desc: e.message,
        buttons: [
          DialogButton(
            radius: BorderRadius.circular(25),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.blue,
            child: Text(
              'Okay',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            ),
          ),
        ],
        style: AlertStyle(
          backgroundColor: Colors.cyan,
          titleStyle: TextStyle(fontWeight: FontWeight.bold),
          descStyle: TextStyle(color: Colors.red),
          buttonAreaPadding: EdgeInsets.all(15),
        ),
      ).show();
    }
  }

  @override
  void initState() {
    setState(() {
      dobValue = getdate(widget.dobValue);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: Text(
          widget.rollNo.toString(),
          style: TextStyle(
            fontSize: 25.0,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/back.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'Details',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 250,
                      width: 250,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.yellow, width: 1)),
                      child: Image.file(widget.idPhoto),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: Colors.blue,
                      thickness: 3,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.nameCollege,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 25,
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Name: ${widget.nameStudent}',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.cyan,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Roll number: ${widget.rollNo}',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.cyan,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Date of Birth: $dobValue',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.cyan,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Branch: ${widget.branch}',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.cyan,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Finish Year: ${widget.finishYear}',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.cyan,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ButtonTheme(
                    padding: EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    buttonColor: Colors.cyan,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Edit Details',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  ButtonTheme(
                    padding: EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    buttonColor: Colors.cyan,
                    child: RaisedButton(
                      onPressed: () {
                        Alert(
                          context: context,
                          style: AlertStyle(
                            backgroundColor: Colors.cyan,
                          ),
                          title: "Final Confirmation",
                          desc:
                              "Are You Sure You Want to Generate Your ID Card with these Details?",
                          buttons: [],
                          content: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                ButtonTheme(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  buttonColor: Colors.black,
                                  child: RaisedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'No',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                ButtonTheme(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  buttonColor: Colors.black,
                                  child: RaisedButton(
                                    onPressed: () async {
                                      await firestoreAdd();
                                      Navigator.pop(
                                          context); //removing alertbox
                                      Navigator.pop(
                                          context); //removing the page below
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => IDcard(
                                                    rollno: widget.rollNo,
                                                    idPhoto: widget.idPhoto,
                                                  ))); //removing the form page and jst displaying the id card
                                    },
                                    child: Text(
                                      'Yes',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ).show();
                      },
                      child: Text(
                        'Generate ID ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
