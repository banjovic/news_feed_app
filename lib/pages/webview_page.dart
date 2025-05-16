import 'package:flutter/material.dart';
import 'package:news_feed_app/utils/constants.dart';
import 'package:news_feed_app/widgets/bottom_nav_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String url;
  const WebViewPage({super.key, required this.url});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Instantiate the controller and configure it
    _controller =
        WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setBackgroundColor(const Color(0x00000000))
          ..setNavigationDelegate(
            NavigationDelegate(
              onPageStarted: (_) => setState(() => _isLoading = true),
              onPageFinished: (_) => setState(() => _isLoading = false),
              onWebResourceError: (_) => setState(() => _isLoading = false),
            ),
          )
          ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Article',
          style: TextStyle(
            color: mBackgroundColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: mCardColor,
        iconTheme: IconThemeData(color: mBackgroundColor),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // This is the actual web view
            WebViewWidget(controller: _controller),
            // A loading indicator while the page loads
            if (_isLoading) const Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
