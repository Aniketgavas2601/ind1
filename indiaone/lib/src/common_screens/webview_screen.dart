import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  //const WebViewScreen({Key? key}) : super(key: key);
  String url;

  WebViewScreen({required this.url});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  @override
  Widget build(BuildContext context) {
    double progress = 0.0;
    bool isVisible = true;

    WebViewController _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            if(progress > 99){
              Future.delayed(Duration(seconds: 1)).then((value) {
                isVisible = false;
                setState(() {

                });
              });
            }
          },
          // onPageStarted: (String url) {},
          // onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));

    return Scaffold(
      appBar: AppBar(
        title: Text('Terms & Conditions'),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Visibility(
            visible: isVisible,
            child: LinearProgressIndicator(
              color: Color(0xff808080),
              backgroundColor: Colors.black,
              value: progress,
            ),
          ),
          Expanded(
            child: WebViewWidget(
              controller: _controller,
            ),
          )
        ],
      )),
    );
  }
}
