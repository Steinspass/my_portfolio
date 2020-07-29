import 'package:flutter/material.dart';
import 'package:my_portfolio/pages/my_home_page.dart';
import 'package:my_portfolio/theme/my_theme.dart';

void main() {
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Naim Freelancer Developer',
      theme: myThemeWeb(),
      home: MyHomePage(),
    );
  }
}

