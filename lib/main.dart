import 'package:flutter/material.dart';
import 'package:vertical_landing_page/router/router.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    fluroRouter.configureRoutes();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Landing Page",
      initialRoute: '/home',
      onGenerateRoute: fluroRouter.router.generator,
    );
  }
}
