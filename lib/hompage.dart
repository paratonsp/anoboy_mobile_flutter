// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_print

import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter/material.dart';

class WebViewExample extends StatefulWidget {
  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<WebViewExample> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse("https://62.182.83.93/")),
        onEnterFullscreen: (controller) {
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.landscapeLeft,
            DeviceOrientation.landscapeRight,
          ]);
        },
        onExitFullscreen: (controller) {
          SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
        },
        onPageCommitVisible: (con, uri) {
          String url = uri.toString();
          if (url.contains("62.182.83.93")) {
          } else {
            con.goBack();
          }
        },
      ),
    );
  }
}
