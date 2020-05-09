import 'dart:io';
import 'package:flutter/material.dart';
import 'package:idcard_generator/finalConfirmation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Dataform extends StatefulWidget {
  @override
  _DataformState createState() => _DataformState();
}

class _DataformState extends State<Dataform> {
  //variables
  String nameCollege, nameStudent, dobValue, branch;
  int rollNo, finishYear;
  File idPhoto;
  String dob = "Date of Birth";
  String imagestatus = 'Upload your picture';

  final snackbar = SnackBar(
    content: Text(
      'Photo Added',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 20, color: Colors.white),
    ),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.blue,
    duration: Duration(seconds: 1),
  );

  //functions
  Future getcameraimage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      idPhoto = image;
      imagestatus = 'View/Edit your picture  ';
    });
  }

  Future getgalleryimage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      idPhoto = image;
      imagestatus = 'View/Edit your picture  ';
    });
  }

  //validation
  validation() {
    if (nameCollege == null ||
        nameStudent == null ||
        dobValue == null ||
        rollNo == null ||
        finishYear == null ||
        branch == null ||
        idPhoto == null ||
        nameCollege == ' ' ||
        nameStudent == ' ' ||
        branch == ' ' ||
        nameCollege == '' ||
        nameStudent == '' ||
        branch == '') {
      Alert(
        context: context,
        title: 'Empty fields',
        desc: 'All fields are required',
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
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: Text(
          'Enter Data',
          style: TextStyle(
            fontSize: 25.0,
            color: Colors.black,
          ),
        ),
      ),
      body: Builder(
        builder: (context) => SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(5),
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
                  'Enter your details',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      TextField(
                        maxLength: 50,
                        maxLengthEnforced: true,
                        maxLines: 2,
                        enableSuggestions: true,
                        textCapitalization: TextCapitalization.words,
                        style: TextStyle(color: Colors.yellow, fontSize: 25),
                        autocorrect: true,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.yellow,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.yellow,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            labelText: 'Name of College',
                            labelStyle: TextStyle(
                              color: Colors.orange,
                            ),
                            helperText: '*required',
                            helperStyle: TextStyle(color: Colors.red)),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              nameCollege = value;
                            });
                          }
                        },
                        onSubmitted: (value) {
                          FocusScope.of(context).nextFocus();
                        },
                      ),
                      SizedBox(height: 10),
                      TextField(
                        maxLength: 20,
                        maxLengthEnforced: true,
                        enableSuggestions: true,
                        textCapitalization: TextCapitalization.words,
                        style: TextStyle(color: Colors.yellow, fontSize: 25),
                        autocorrect: true,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.yellow,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.yellow,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            labelText: 'Full Name Of Student',
                            labelStyle: TextStyle(
                              color: Colors.orange,
                            ),
                            helperText: '*required',
                            helperStyle: TextStyle(color: Colors.red)),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              nameStudent = value;
                            });
                          }
                        },
                        onSubmitted: (value) {
                          FocusScope.of(context).nextFocus();
                        },
                      ),
                      SizedBox(height: 10),
                      TextField(
                        maxLength: 6,
                        maxLengthEnforced: true,
                        enableSuggestions: true,
                        keyboardType: TextInputType.number,
                        textCapitalization: TextCapitalization.words,
                        style: TextStyle(color: Colors.yellow, fontSize: 25),
                        autocorrect: true,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.yellow,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.yellow,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            labelText: 'Roll Number Of Student',
                            labelStyle: TextStyle(
                              color: Colors.orange,
                            ),
                            helperText: '*required',
                            helperStyle: TextStyle(color: Colors.red)),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              rollNo = int.parse(value);
                            });
                          }
                        },
                        onSubmitted: (value) {
                          FocusScope.of(context).nextFocus();
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.yellow,
                            width: 2,
                          ),
                        ),
                        child: Row(
                          children: <Widget>[
                            Text(
                              dob,
                              style:
                                  TextStyle(color: Colors.orange, fontSize: 30),
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            IconButton(
                              onPressed: () async {
                                showDatePicker(
                                        context: context,
                                        initialDate: DateTime(2000),
                                        firstDate: DateTime(1990),
                                        lastDate: DateTime.now())
                                    .then((date) {
                                  if (date != null) {
                                    setState(() {
                                      dob = date.toString().split(' ')[0];
                                      dobValue = dob;
                                    });
                                  }
                                });
                              },
                              icon: Icon(
                                Icons.calendar_today,
                                color: Colors.orange,
                                size: 30,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '*required',
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.red),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        maxLength: 10,
                        maxLengthEnforced: true,
                        enableSuggestions: true,
                        textCapitalization: TextCapitalization.words,
                        style: TextStyle(color: Colors.yellow, fontSize: 25),
                        autocorrect: true,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.yellow,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.yellow,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            labelText: 'Branch Of Student',
                            labelStyle: TextStyle(
                              color: Colors.orange,
                            ),
                            helperText: '*required',
                            helperStyle: TextStyle(color: Colors.red)),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              branch = value;
                            });
                          }
                        },
                        onSubmitted: (value) {
                          FocusScope.of(context).nextFocus();
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        maxLength: 4,
                        maxLengthEnforced: true,
                        enableSuggestions: true,
                        keyboardType: TextInputType.number,
                        textCapitalization: TextCapitalization.words,
                        style: TextStyle(color: Colors.yellow, fontSize: 25),
                        autocorrect: true,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.yellow,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.yellow,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            labelText: 'Finish year (YYYY)',
                            labelStyle: TextStyle(
                              color: Colors.orange,
                            ),
                            helperText: '*required',
                            helperStyle: TextStyle(color: Colors.red)),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              finishYear = int.parse(value);
                            });
                          }
                        },
                        onSubmitted: (value) {
                          FocusScope.of(context).unfocus();
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.yellow,
                            width: 2,
                          ),
                        ),
                        child: Row(
                          children: <Widget>[
                            Text(
                              imagestatus,
                              style:
                                  TextStyle(color: Colors.orange, fontSize: 20),
                            ),
                            SizedBox(
                              width: 35,
                            ),
                            IconButton(
                              onPressed: () {
                                if (idPhoto == null) {
                                  Alert(
                                    context: context,
                                    title: 'Select method',
                                    buttons: [],
                                    style: AlertStyle(
                                      backgroundColor: Colors.black,
                                      titleStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    content: Container(
                                      padding: EdgeInsets.all(25),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          FlatButton(
                                            padding: EdgeInsets.all(10),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25)),
                                            onPressed: () async {
                                              await getcameraimage();
                                              Navigator.pop(context);
                                              Scaffold.of(context)
                                                  .showSnackBar(snackbar);
                                            },
                                            color: Colors.blue,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  'Camera',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 25,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Icon(
                                                  Icons.photo_camera,
                                                  color: Colors.black,
                                                  size: 30,
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          FlatButton(
                                            padding: EdgeInsets.all(10),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25)),
                                            onPressed: () async {
                                              await getgalleryimage();
                                              Navigator.pop(context);
                                              Scaffold.of(context)
                                                  .showSnackBar(snackbar);
                                            },
                                            color: Colors.blue,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  'Gallery',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 25,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Icon(
                                                  Icons.camera,
                                                  color: Colors.black,
                                                  size: 30,
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ).show();
                                } else {
                                  Alert(
                                    context: context,
                                    title: 'Your Image',
                                    buttons: [],
                                    style: AlertStyle(
                                      backgroundColor: Colors.black,
                                      titleStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    content: SingleChildScrollView(
                                      child: Container(
                                        padding: EdgeInsets.all(20),
                                        child: Column(
                                          children: <Widget>[
                                            Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.white,
                                                  width: 2,
                                                ),
                                              ),
                                              child: Image.file(idPhoto),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                FlatButton(
                                                  padding: EdgeInsets.all(10),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25)),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    Alert(
                                                      context: context,
                                                      title: 'Select method',
                                                      buttons: [],
                                                      style: AlertStyle(
                                                        backgroundColor:
                                                            Colors.black,
                                                        titleStyle: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 25,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      content: Container(
                                                        padding:
                                                            EdgeInsets.all(25),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            FlatButton(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(10),
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              25)),
                                                              onPressed:
                                                                  () async {
                                                                await getcameraimage();
                                                                Navigator.pop(
                                                                    context);
                                                                Scaffold.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                        snackbar);
                                                              },
                                                              color:
                                                                  Colors.blue,
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: <
                                                                    Widget>[
                                                                  Text(
                                                                    'Camera',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          25,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 20,
                                                                  ),
                                                                  Icon(
                                                                    Icons
                                                                        .photo_camera,
                                                                    color: Colors
                                                                        .black,
                                                                    size: 30,
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 15,
                                                            ),
                                                            FlatButton(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(10),
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              25)),
                                                              onPressed:
                                                                  () async {
                                                                await getgalleryimage();
                                                                Navigator.pop(
                                                                    context);
                                                                Scaffold.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                        snackbar);
                                                              },
                                                              color:
                                                                  Colors.blue,
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: <
                                                                    Widget>[
                                                                  Text(
                                                                    'Gallery',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          25,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 20,
                                                                  ),
                                                                  Icon(
                                                                    Icons
                                                                        .camera,
                                                                    color: Colors
                                                                        .black,
                                                                    size: 30,
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ).show();
                                                  },
                                                  color: Colors.blue,
                                                  child: Text(
                                                    'Edit',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 25,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 15),
                                                FlatButton(
                                                  padding: EdgeInsets.all(10),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25)),
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
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ).show();
                                }
                              },
                              icon: Icon(
                                Icons.photo_camera,
                                color: Colors.orange,
                                size: 30,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '*required',
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.red),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                  padding: EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {
                    if (validation()) {
                      Alert(
                        context: context,
                        style: AlertStyle(
                          backgroundColor: Colors.cyan,
                        ),
                        title: "Submit",
                        desc: "Are you sure you want to submit?",
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
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Confirmation(
                                                  nameCollege: nameCollege,
                                                  nameStudent: nameStudent,
                                                  dobValue: dobValue,
                                                  branch: branch,
                                                  rollNo: rollNo,
                                                  finishYear: finishYear,
                                                  idPhoto: idPhoto,
                                                )));
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
                    }
                  },
                  color: Colors.blue,
                  child: Text(
                    'Submit',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
