import 'package:flutter/material.dart';
import 'package:vertical_landing_page/ui/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Landing Page",
      home: HomePage(),
    );
  }
}
