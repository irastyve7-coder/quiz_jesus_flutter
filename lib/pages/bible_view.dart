// lib/pages/bible_view.dart
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BibleViewPage extends StatelessWidget {
  final String reference;

  const BibleViewPage({super.key, required this.reference});

  @override
  Widget build(BuildContext context) {
    final encodedRef = Uri.encodeComponent(reference);
    final url =
        'https://www.biblegateway.com/passage/?search=$encodedRef&version=LSG';

    return Scaffold(
      appBar: AppBar(
        title: Text(reference),
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: WebViewWidget(
        controller: WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(Uri.parse(url)),
      ),
    );
  }
}
