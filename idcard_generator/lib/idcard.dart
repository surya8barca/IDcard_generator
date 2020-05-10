import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:idcard_generator/home.dart';
import 'package:idcard_generator/loadingScreen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:async';

class IDcard extends StatefulWidget {
  final File idPhoto;
  final int rollno;
  IDcard({this.rollno, this.idPhoto});

  @override
  _IDcardState createState() => _IDcardState();
}

class _IDcardState extends State<IDcard> {
  String nameCollege, nameStudent, dobValue, branch, idPhoto;
  int rollNo, finishYear;
  File upload;

  //uploading to firebase storage

  Future<void> fileUpload() async {
    try {
      final FirebaseStorage storage = FirebaseStorage(
          storageBucket: 'gs://idcardgenerator-80a4b.appspot.com');
      final StorageReference uploader = storage.ref().child(rollNo.toString());
      StorageUploadTask task = uploader.putFile(upload);
      await task.onComplete;
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

  //getting database
  Future<void> getdatabase() async {
    await fileUpload();
    dynamic snapShot;
    final CollectionReference fire = Firestore.instance.collection('Database');
    try {
      snapShot = await fire.document(rollNo.toString()).get();
      setState(() {
        nameCollege = snapShot["college_name"];
        nameStudent = snapShot["student_name"];
        dobValue = snapShot["date_of_birth"];
        branch = snapShot["branch"];
        finishYear = snapShot["validity"];
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
    await getimage();
  }

  //getting image url

  Future<void> getimage() async {
    final FirebaseStorage storage = FirebaseStorage(
        storageBucket: 'gs://idcardgenerator-80a4b.appspot.com');
    final StorageReference downloader = storage.ref().child(rollNo.toString());
    try {
      String url = await downloader.getDownloadURL();
      setState(() {
        idPhoto = url;
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
      rollNo = widget.rollno;
      upload = widget.idPhoto;
    });
    getdatabase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (idPhoto == null) {
      return Loading();
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
          title: Text(
            widget.rollno.toString(),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'ID Card',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    border:Border.all(
                      color: Colors.red,
                      width: 5,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(                        //college name bar
                          width: MediaQuery.of(context).size.width,
                          color: Colors.green,
                          child: Text(
                            nameCollege,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.fromLTRB(10,20, 10, 10),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    height: 120,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 2,
                                      ),
                                      image: DecorationImage(
                                        image: NetworkImage(idPhoto),
                                        fit: BoxFit.contain                                    ),
                                    ),
                                  ),
                                ],
                              ),
                            ),                  
                            Container(
                              height: 120,
                              width: 190,   
                              child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Name:',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      nameStudent,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Roll No:',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Text(
                                      rollNo.toString(),
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Date of Birth:',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Text(
                                      dobValue,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Branch:',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Text(
                                      branch,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            ),                       
                          ],
                        ),
                        Text(
                                    'Valid till $finishYear',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 15,
                                    ),
                                  ),
                          SizedBox(height: 2,),
                        Container(                        //college name bar
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            'IF FOUND, PLEASE RETURN',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Screenshot the ID Card to save it in Your Phone Gallery',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ButtonTheme(
                  padding: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  buttonColor: Colors.cyan,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                    child: Text(
                      'Home',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
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
}
