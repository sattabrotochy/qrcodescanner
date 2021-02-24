import 'package:flutter/material.dart';
class CodeDetails extends StatefulWidget {
  @override
  _CodeDetailsState createState() => _CodeDetailsState();
}

class _CodeDetailsState extends State<CodeDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 200,
                color: Colors.green,
              ),

              Container(
               margin: EdgeInsets.only(top: 110,left: 20,right: 20),
                height: 200,
                color: Colors.white,

                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [

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
}
