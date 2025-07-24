import 'package:flutter/material.dart';
import 'package:vertical_landing_page/ui/shared/custom_app_menu.dart';

import 'package:vertical_landing_page/ui/views/about_view.dart';
import 'package:vertical_landing_page/ui/views/contact_view.dart';
import 'package:vertical_landing_page/ui/views/home_view.dart';
import 'package:vertical_landing_page/ui/views/location_view.dart';
import 'package:vertical_landing_page/ui/views/pricing_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: buildBoxDecoration(),
        child: Stack(
          children: [
            _HomeBody(),
            Positioned(right: 20, top: 20, child: CustomAppMenu()),
          ],
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color(0xFF800f2f),
        Color(0xFF9e0059),
        Color(0xFF0ff0054),
        Color(0xFFFF5400),
        Color(0xFFFFBD00),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.0, 0.25, 0.5, 0.75, 1.0],
    ),
  );
}

class _HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      children: [
        HomeView(),
        AboutView(),
        ContactView(),
        LocationView(),
        PricingView(),
      ],
    );
  }
}
