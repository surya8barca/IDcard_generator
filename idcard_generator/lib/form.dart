import 'package:flutter/material.dart';

class Dataform extends StatefulWidget {
  @override
  _DataformState createState() => _DataformState();
}

class _DataformState extends State<Dataform> {
  String nameCollege, nameStudent, dob, branch;
  int rollNo, finishYear;
  Image picture;

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
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
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
                    //input calender for DOB
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
                      height: 20,
                    ),
                    //button for getting image
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //submit button
            ],
          ),
        ),
      ),
    );
  }
}
