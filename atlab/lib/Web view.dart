import 'dart:async';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatefulWidget {
  final String Ur;
  const WebView({super.key , required this.Ur});

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  @override
  late final WebViewController _controller;
  bool HasInternet=true;
  StreamSubscription?_internetStream;
  void initState()
  {
    super.initState();
    _internetStream=InternetConnection().onStatusChange.listen((event){
      switch(event)
      {
        case InternetStatus.connected:
          setState(() {
            HasInternet=true;
          });

         break;
        case InternetStatus.disconnected:
         setState(() {
           HasInternet=false;
         });
          break;
        default:
          setState(() {
            HasInternet=false;
          });
      }
    });
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.Ur));

  }
  void dispose()
  {
    _internetStream?.cancel();
    super.dispose();

  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("ATL LAB",style: TextStyle(fontSize: 30,color: Colors.white),),
        leading:IconButton(
          onPressed: ()
          {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,size: 30,color: Colors.white,),
        ),
      ),
      body: HasInternet?WebViewWidget(controller: _controller):
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.wifi_off, size: 80, color: Colors.grey),
                SizedBox(height: 20),
                Text(
                  "No Internet Connection",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
              ],
            ),
          )

    );
  }
}
