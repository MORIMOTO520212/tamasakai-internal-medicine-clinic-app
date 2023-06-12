import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '多摩境内科クリニックアプリ',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: '多摩境内科クリニックアプリ'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            OutlinedButton(
                onPressed: () => _opneUrl('https://coubic.com/timc/booking_pages#pageContent'),
                child: const Text(
                  'クリニックへ予約する', 
                  style: TextStyle(fontWeight: FontWeight.bold) )),

            OutlinedButton(
                onPressed: () => _opneUrl('https://zoom.us/j/3789782777?pwd=cnZyUXpKVDNmSVErYm91Q0oyWVk4Zz09'),
                child: const Text(
                  'オンライン診療（Zoom）', 
                  style: TextStyle(fontWeight: FontWeight.bold) )),

            OutlinedButton(
                onPressed: () => _opneUrl('https://tamasakainaika.timc03.jp/'), 
                style: OutlinedButton.styleFrom(
                  maximumSize: const Size.fromWidth(300)
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("ホームページ", style: TextStyle(
                      fontSize: 20, 
                      fontWeight: FontWeight.bold)
                    ),
                    Text("こちらからクリニックのホームページを確認できます。"),
                  ],
                ),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>{},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _opneUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
      );
    } else {
      throw 'このURLにはアクセスできません';
    }
  }
}
