import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new WebviewScaffold(
        url: 'https://m.jd.com',
        appBar: new AppBar(
          title: new Text('京东'),
          backgroundColor: Colors.red,
        ),
        withZoom: true,
        withLocalStorage: true,
        hidden: true,
        initialChild: Container(
          color: Colors.redAccent,
          child: const Center(
            child: Text('Waiting.....'),
          ),
        ),
      );
}
