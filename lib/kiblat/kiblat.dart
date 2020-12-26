import 'package:khiyaar/kiblat/compass_view.dart';
import 'package:flutter/material.dart';
import 'package:khiyaar/beranda/beranda_khiyaar_appbar.dart';

void main() => runApp(Kiblat());

class Kiblat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Arah Kiblat',
      theme: ThemeData(),
      home: CompassView(),
    );
  }
}
