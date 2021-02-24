import 'package:flutter/material.dart';
import 'package:qrcodescanner/screen/code_details.dart';
import 'package:qrcodescanner/screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: CodeDetails(),

    );
  }
}
