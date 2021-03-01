import 'package:flutter/material.dart';
import 'package:qrcodescanner/screen/history_list.dart';
import 'package:qrcodescanner/screen/save_list.dart';

import 'package:flutter_share/flutter_share.dart';
import 'package:url_launcher/url_launcher.dart';


Widget drawer(BuildContext context) {
  return Container(
    color: Colors.white,
    child: Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: 2,),
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'asset/drawer_image.png',
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

                sharedata("QR Code Scanner",
                    "https://www.youtube.com/results?search_query=+share+system+use+in+flutter");
              },
              title: Text("Share"),
              leading: Icon(Icons.share_rounded,color: Colors.cyan[600],),
            ),
            ListTile(
              onTap: _launchURL,
              title: Text("More Apps"),
              leading: Icon(Icons.mobile_friendly_rounded,color: Colors.cyan[600]),
            ),
          ],
        ),
      ),
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
  String url = '';
  await launch(url);
}
