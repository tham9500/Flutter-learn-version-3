import 'package:flutter/material.dart';
import 'package:test/page/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: 'test',
        initialRoute: '/',
        routes: {
          '/':(context)=>Home_page(),
        },
      ),
    );
  }
}
