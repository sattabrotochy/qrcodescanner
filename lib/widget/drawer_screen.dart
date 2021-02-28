import 'package:flutter/material.dart';
import 'package:qrcodescanner/screen/history_list.dart';
import 'package:qrcodescanner/screen/save_list.dart';

Widget drawer(BuildContext context) {
  return Container(
    color: Colors.white,
    child: Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(
                  'asset/qr_code_scanning.jpg',
                ),
                fit: BoxFit.cover,
              )),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => SaveList()));
              },
              hoverColor: Colors.cyan[600],
              title: Text('Favorite'),
              leading: Icon(
                Icons.favorite,
                color: Colors.cyan[600],
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HistoryList()));
              },
              hoverColor: Colors.cyan[600],
              title: Text('History'),
              leading: Icon(
                Icons.history,
                color: Colors.cyan[600],
              ),
            ),
            ListTile(
              onTap: () {
                //  HistoryList

                //  sharedata("lallal",
                //     "https://www.youtube.com/results?search_query=+share+system+use+in+flutter");
                // FlutterShare.share(
                //     title: "sad",
                //     linkUrl: "https://www.youtube.com/watch?v=AdnVzpYYcuI");
              },
              title: Text("Share"),
              leading: Icon(Icons.share_rounded),
            ),
            ListTile(
              //   onTap: _launchURL,
              title: Text("More Apps"),
              leading: Icon(Icons.mobile_friendly_rounded),
            ),
            ListTile(
              onTap: () {
                // Navigator.of(context).push(
                //     MaterialPageRoute(builder: (context) => AirtelPage()));
                // Navigator.of(context).pop();
              },
              title: Text("About"),
              leading: Icon(Icons.list),
            )
          ],
        ),
      ),
    ),
  );
}
