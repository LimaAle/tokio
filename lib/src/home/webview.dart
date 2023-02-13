import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:tokiomarineapp/src/colors.dart';

class InAppWebview extends StatefulWidget {
  const InAppWebview({super.key});

  @override
  State<InAppWebview> createState() => _InAppWebviewState();
}

class _InAppWebviewState extends State<InAppWebview> {
  InAppWebViewController? webViewController;
  PullToRefreshController? refreshController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: colorBackgroundDark,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.arrow_back),
          )),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
            url: Uri.parse("https://www.tokiomarine.com.br/cotacao-auto/")),
      ),
    );
  }
}
