import 'package:flutter/material.dart';

import 'home_vu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Platform Integration',
      theme: ThemeData(
          primaryColor: Colors.cyan[900]
      ),
      home: const HomeScreen(),
    );
  }
}



