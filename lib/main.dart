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
            MyElements.menuButton(
                'https://coubic.com/timc/booking_pages#pageContent',
                'クリニックへ予約する',
                'ここからクリニックへ予約することができます。'),
            MyElements.menuButton(
                'https://zoom.us/j/3789782777?pwd=cnZyUXpKVDNmSVErYm91Q0oyWVk4Zz09',
                'オンライン診療（Zoom）',
                'ここからZoomを開いてオンライン診療を行います。',
                isApp: true),
            MyElements.menuButton('https://tamasakainaika.timc03.jp/', 'ホームページ',
                'こちらからクリニックのホームページを確認できます。'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MyElements {
  // menuButton - メニューボタン
  // isAppはtrueにするとURLからアプリを開くことができる
  static Container menuButton(String url, String title, String message, {bool isApp = false}) {
    return Container(
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        child: OutlinedButton(
          onPressed: () => _opneUrl(url, isApp),
          style: MyStyles.menuButton,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              Text(message),
            ],
          ),
        ));
  }
}

void _opneUrl(String url, bool isApp) async {
  LaunchMode openMode = LaunchMode.platformDefault;
  if (isApp) {
    openMode = LaunchMode.externalNonBrowserApplication;
  }
  final Uri urlParse = Uri.parse(url);
  if (await canLaunchUrl(urlParse)) {
    await launchUrl(urlParse, mode: openMode);
  } else {
    debugPrint('このURLにはアクセスできません');
  }
}

class MyStyles {
  static final menuButton = OutlinedButton.styleFrom(
    maximumSize: const Size.fromWidth(300),
    padding: const EdgeInsets.all(20),
  );
}
