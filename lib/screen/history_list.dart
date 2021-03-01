import 'package:flutter/material.dart';
import 'package:qrcodescanner/Database/database_halper.dart';
import 'package:qrcodescanner/Model/my_model.dart';
import 'package:qrcodescanner/screen/Details_screen.dart';
import 'package:sqflite/sqflite.dart';

class HistoryList extends StatefulWidget {
  @override
  _HistoryListState createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note> noteList;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (noteList == null) {
      // ignore: deprecated_member_use
      noteList = List<Note>();
      updateListView();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[600],
        title: Text("History"),
      ),
      body: getNoteListView(),
    );
  }

  ListView getNoteListView() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Card(
            color: Colors.cyan[600],
            elevation: 2.0,
            child: noteList != null?ListTile(
              title: Text(
                this.noteList[index].title,
                style: TextStyle(color: Colors.white),
              ),
              trailing: GestureDetector(
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
                onTap: () {
                  _delete(context, noteList[index]);
                },
              ),
              onTap: () {
                // debugPrint("ListTile Tapped");
                navigateToDetail(this.noteList[index], 'History');
              },
            ):Center(
              child: Text('No Data'),
            ),
          ),
        );
      },
    );
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Note>> noteListFuture = databaseHelper.getNoteList2();
      noteListFuture.then((noteList) {
        setState(() {
          this.noteList = noteList;
          this.count = noteList.length;
        });
      });
    });
  }

  void _delete(BuildContext context, Note note) async {
    int result = await databaseHelper.deleteNote2(note.id);
    if (result != 0) {
      _showSnackBar(context, 'Note Deleted Successfully');
      updateListView();
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar =
    SnackBar(backgroundColor: Colors.cyan[600], content: Text(message));
    // ignore: deprecated_member_use
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void navigateToDetail(Note note, String title) async {
    bool result =
    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return DetailsScreen(note, title);
    }));

    if (result == true) {
      updateListView();
    }
  }
}
