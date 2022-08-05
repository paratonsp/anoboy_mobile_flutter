// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_print

import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter/material.dart';

class WebViewExample extends StatefulWidget {
  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<WebViewExample> {
  String link = "62.182.83.93";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse("https://$link")),
        onEnterFullscreen: (controller) {
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.landscapeLeft,
          ]);
        },
        onExitFullscreen: (controller) {
          SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
        },
        onPageCommitVisible: (con, uri) {
          String url = uri.toString();
          if (url.contains(link)) {
          } else {
            con.goBack();
          }
        },
      ),
    );
  }
}
