import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WebViewApp(),
    );
  }
}

class WebViewApp extends StatefulWidget {
  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  int _selectedIndex = 0;
  final List<String> _urls = [
    'https://vip.ksalibrary.com',
    'https://vip.ksalibrary.com/profile.php',
    'https://vip.ksalibrary.com/my_reports.php',
    'https://vip.ksalibrary.com/all_notifications',
    'https://vip.ksalibrary.com/updates.php',
  ];
  late WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebView(
          initialUrl: _urls[_selectedIndex],
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (controller) {
            _controller = controller;
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF4ECAC2),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            _controller.loadUrl(_urls[_selectedIndex]);
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'ملفي'),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'تقاريري'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'الرسائل'),
          BottomNavigationBarItem(icon: Icon(Icons.update), label: 'التحديثات'),
        ],
      ),
    );
  }
}
