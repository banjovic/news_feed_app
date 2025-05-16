import 'package:flutter/material.dart';
import 'package:news_feed_app/pages/home_page.dart';
import 'package:news_feed_app/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Feed App',
      theme: ThemeData(scaffoldBackgroundColor: mBackgroundColor),
      home: const HomePage(),
    );
  }
}
