import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => WebView(
        initialUrl: 'https://m.jd.com',
        // javascriptMode: JavascriptMode.unrestricted,
        // onWebViewCreated: (WebViewController webViewController) {
        //   // _controller.complete(webViewController);
        // }
      );
}
