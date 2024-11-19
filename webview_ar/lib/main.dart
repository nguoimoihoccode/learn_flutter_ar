// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(const MaterialApp(home: WebViewExample()));

class WebViewExample extends StatefulWidget {
  const WebViewExample({super.key});

  @override
  State<WebViewExample> createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    // #docregion webview_controller
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      );
      _loadHtmlFromAssets();
    // #enddocregion webview_controller
  }

  Future<void> _loadHtmlFromAssets() async {
  // Load HTML file
  final htmlData = await rootBundle.loadString('assets/images/test.html');
  
  // Load GLB file as bytes
  final glbData = await rootBundle.load('assets/models/2018_maserati_granturismo.glb');
  final glbBase64 = base64Encode(glbData.buffer.asUint8List());

  // Embed GLB as Blob URL in HTML
  final htmlWithGlbBlob = htmlData.replaceFirst(
    'src="assets/models/2018_maserati_granturismo.glb"',
    'src="data:model/gltf-binary;base64,$glbBase64"'
  );

  // Load the modified HTML
  controller.loadRequest(Uri.dataFromString(
    htmlWithGlbBlob,
    mimeType: 'text/html',
    encoding: Encoding.getByName('utf-8'),
  ));
}

  // #docregion webview_widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Simple Example')),
      body: WebViewWidget(controller: controller),
    );
  }
  // #enddocregion webview_widget
}