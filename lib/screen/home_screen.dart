import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:qrcodescanner/Model/my_model.dart';
import 'package:qrcodescanner/screen/code_details.dart';
import 'package:qrcodescanner/widget/drawer_screen.dart';
import '../Database/database_halper.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note> noteList;

  var qrCode = 'Unknown';




  Future scanQRCode() async {
    try {
      var qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#008000',
        'Cancel',
        true,
        ScanMode.QR,
      );
      if (!mounted)
        return qrCode="no data";

      if(qrCode== '-1')
        {
         qrCode="no data";
        // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CodeDetails(code: qrCode,)));
         navigateToDetail(Note(''),qrCode);
        }
      else{
        setState(() {

            this.qrCode = qrCode;
           // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CodeDetails(code: qrCode,)));

            navigateToDetail(Note(''),qrCode);
        });
      }

    } on PlatformException {
      qrCode = 'Failed to get platform version.';
    }
  }


  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.cyan[600]);
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: drawer(context),
      appBar: AppBar(
        backgroundColor: Colors.cyan[600],
        title: Text("Qr Code Scanner"),

      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Colors.cyan,
        onPressed: scanQRCode,
        child: Image(
          height: 50,
          width: 50,
          image: AssetImage('asset/qr-code.png'),
        )
      ),
      bottomNavigationBar: BottomAppBar(

        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              color: Colors.cyan[600],
              height: 50,
                child: Text('')),
            Text('')
          ],
        ),
      ),

        body: Center(

          child: Image(
            image: AssetImage('asset/qr_code_scanning.jpg'),
          ),
    ),
    );
  }

  void navigateToDetail(Note note,String code) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
      return CodeDetails(note,code);
    }));
  }
}
