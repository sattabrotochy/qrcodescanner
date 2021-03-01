import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:qrcodescanner/Model/my_model.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreen extends StatefulWidget {
  final String title;
  final Note note;

  DetailsScreen(this.note, this.title);

  @override
  _DetailsScreenState createState() {
    return _DetailsScreenState(this.note, this.title);
  }
}

class _DetailsScreenState extends State<DetailsScreen> {
  String title;
  Note note;
  String name;

  _DetailsScreenState(this.note, this.title);

  GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.cyan[600]);

    name = note.title;

    return Scaffold(
      key: key,
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
                          margin: EdgeInsets.only(top: 30, left: 15),
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios,
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
                            name,
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
                              Clipboard.setData(new ClipboardData(text: name));
                              // ignore: deprecated_member_use
                              key.currentState.showSnackBar(new SnackBar(
                                content: new Text("Copied to Clipboard"),
                              ));
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
                                Icons.copy,
                                color: Colors.white,
                                size: 30,
                              )),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              sharedata(" ", "$name");
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
                            onTap: _launchURL,
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
    String url = name;
    await launch(url);
    // if (await canLaunch(widget.code)) {
    //   await launch(widget.code);
    // } else {
    //   throw 'Could not launch';
    // }
  }
}
