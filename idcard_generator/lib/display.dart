import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:idcard_generator/loadingScreen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:async';

class Showdata extends StatefulWidget {

  final int rollno;
  Showdata({this.rollno});

  @override
  _ShowdataState createState() => _ShowdataState();
}

class _ShowdataState extends State<Showdata> {
  String nameCollege, nameStudent, dobValue, branch,idPhoto;
  int rollNo, finishYear;



  Future<void>getdatabase()async{
    dynamic snapShot;
    final CollectionReference fire = Firestore.instance.collection('Database');
    try{
      print('datbase entry');
      snapShot = await fire.document(rollNo.toString()).get();
    setState(() {
      nameCollege=snapShot["college_name"];
      nameStudent=snapShot["student_name"];
      dobValue=snapShot["date_of_birth"];
      branch=snapShot["branch"];
      finishYear=snapShot["validity"];
    });
    }
    catch(e){
      print('database error');
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
    Future<void> getimage()async{
    final FirebaseStorage storage = FirebaseStorage(
          storageBucket: 'gs://idcardgenerator-80a4b.appspot.com');
          final StorageReference downloader=storage.ref().child(rollNo.toString());
          try{
            print("file entry");
            String url = await downloader.getDownloadURL();
            print(url);
            setState(() {
              idPhoto=url;
            });
          }
   catch(e){
     print('file error');
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
      rollNo=widget.rollno;
    });
    getdatabase();
    //getimage();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    if(nameCollege==null){
      return Loading();
    }
    else{
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
            padding: EdgeInsets.all(5),
            //background image
           /* decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/back.jpg'),
                fit: BoxFit.cover,
              ),
            ),*/
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1)
                ),
                child: //Image.network(idPhoto),
                Text('Image')
                ),
                Text(nameCollege),
                Text(nameStudent),
                Text(rollNo.toString()),
                Text(branch),
                Text(dobValue),
                Text(finishYear.toString()),
              ],
            ),
        ),
      ),
    );
    }
    
  }
}