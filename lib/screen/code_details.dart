import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:qrcodescanner/Database/database_halper.dart';
import 'package:qrcodescanner/Model/my_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_share/flutter_share.dart';

class CodeDetails extends StatefulWidget {
  String code;
  final Note note;

  CodeDetails(
      this.note,
      this.code,
      );

  @override
  _CodeDetailsState createState() {
    return _CodeDetailsState(this.note, this.code);
  }
}

class _CodeDetailsState extends State<CodeDetails> {
  DatabaseHelper helper = DatabaseHelper();
  String code;
  Note note;

  _CodeDetailsState(this.note, this.code);

  GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.cyan[600]);

    if (widget.code == "no data") {
    } else {
      _saveData();
    }

    return Scaffold(
      key: key,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 250,
                color: Colors.cyan[600],
                child: Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 35, left: 15),
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 30,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ],
                    )),
              ),
              Container(
                margin: EdgeInsets.only(top: 130, left: 20, right: 20),
                height: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.11),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      )
                    ]),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.cyan[600],
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                        child: Center(
                          child: Text(
                            widget.code,
                            style: TextStyle(fontSize: 20, color: Colors.white),
                            maxLines: 1,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () async {
                              if (widget.code == "no data") {
                                // _showSnackBar(context, 'Note Data not found');
                                // ignore: deprecated_member_use
                                key.currentState.showSnackBar(new SnackBar(
                                  backgroundColor: Colors.cyan[600],
                                  content: new Text("Note Data not found"),
                                ));
                              } else {
                                int result;
                                if (note.id != null) {
                                  // Case 1: Update operation
                                  // _showSnackBar(context, 'Note Data not found');
                                } else {
                                  // Case 2: Insert Operation
                                  result = await helper.insertNote(note);
                                  // ignore: deprecated_member_use
                                  key.currentState.showSnackBar(new SnackBar(
                                    backgroundColor: Colors.cyan[600],
                                    content:
                                    new Text("Note Saved Successfully"),
                                  ));
                                  // _showSnackBar(
                                  //     context, 'Note Saved Successfully');
                                }

                                if (result != 0) {
                                  // Success
                                  _showSnackBar(
                                      context, 'Note Saved Successfully');
                                } else {
                                  // Failure
                                  _showSnackBar(context, 'Problem Saving Note');
                                }
                              }
                              note.title = widget.code;
                            },
                            child: Container(
                              width: 70,
                              height: 50,
                              margin: EdgeInsets.only(top: 40),
                              decoration: BoxDecoration(
                                  color: Colors.cyan[600],
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.cyan.withOpacity(0.11),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3),
                                    )
                                  ]),
                              child: Center(
                                  child: Icon(
                                    Icons.favorite_border,
                                    color: Colors.white,
                                    size: 30,
                                  )),
                            ),
                          ),
                          InkWell(
                            onTap: () {

                              if (widget.code == "no data")
                              {
                                // ignore: deprecated_member_use
                                key.currentState.showSnackBar(new SnackBar(
                                  backgroundColor: Colors.cyan[600],
                                  content: new Text("Note Data not found"),
                                ));
                              }
                              else{
                                sharedata(" ", "${widget.code}");
                              }

                            },
                            child: Container(
                              width: 70,
                              height: 50,
                              margin: EdgeInsets.only(top: 40),
                              decoration: BoxDecoration(
                                  color: Colors.cyan[600],
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.cyan.withOpacity(0.11),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3),
                                    )
                                  ]),
                              child: Center(
                                  child: Icon(
                                    Icons.share,
                                    size: 30,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                          InkWell(

                            onTap:()
                            {

                              if (widget.code == "no data")
                              {
                                // ignore: deprecated_member_use
                                key.currentState.showSnackBar(new SnackBar(
                                  backgroundColor: Colors.cyan[600],
                                  content: new Text("Note Data not found"),
                                ));
                              }
                              else if(widget.code != "http")
                              {
                                // ignore: deprecated_member_use
                                key.currentState.showSnackBar(new SnackBar(
                                  backgroundColor: Colors.cyan[600],
                                  content: new Text("This is a text"),
                                ));

                              }
                              else{
                                _launchURL();
                              }


                            },
                            child: Container(
                              width: 70,
                              height: 50,
                              margin: EdgeInsets.only(top: 40),
                              decoration: BoxDecoration(
                                  color: Colors.cyan[600],
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.cyan.withOpacity(0.11),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3),
                                    )
                                  ]),
                              child: Center(
                                  child: Icon(
                                    Icons.open_in_browser,
                                    size: 30,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future sharedata(String s, String t) async {
    await FlutterShare.share(
      title: s,
      linkUrl: t,
    );
  }

  _launchURL() async {
    String url = widget.code;
    await launch(url);
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar =
    SnackBar(backgroundColor: Colors.cyan[600], content: Text(message));
    // ignore: deprecated_member_use
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void _saveData() async {
    note.title = widget.code;
    if (note.id != null) {
    } else {
      await helper.insertNote2(note);
    }
  }
}
