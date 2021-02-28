//
// import 'package:flutter/services.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// import 'package:flutter/material.dart';
// Future<void> scanQRCode() async {
//   try {
//     var qrCode = await FlutterBarcodeScanner.scanBarcode(
//       '#008000',
//       'Cancel',
//       true,
//       ScanMode.QR,
//     );
//     if (!mounted)
//       return qrCode="no data";
//
//     if(qrCode== '-1')
//     {
//       qrCode="no data";
//       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CodeDetails(code: qrCode,)));
//     }
//     else{
//       setState(() {
//
//         this.qrCode = qrCode;
//         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CodeDetails(code: qrCode,)));
//
//       });
//     }
//
//   } on PlatformException {
//     qrCode = 'Failed to get platform version.';
//   }
// }