import 'package:flutter/material.dart';
import 'package:khiyaar/constant.dart';
import 'package:khiyaar/beranda/beranda_view.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => new _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new BerandaPage(),
    );
  }
}
