import 'package:flutter/material.dart';
import 'package:khiyaar/landing/landingpage_view.dart';
import 'package:khiyaar/launcher/launcher_view.dart';
import 'package:khiyaar/constant.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/post.dart';
import 'package:khiyaar/beranda/jadwalkajian.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:hijri_picker/hijri_picker.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Khiyaar',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        //     const Locale('en', 'USA'),
        const Locale('en', 'USA'),
      ],
      theme: new ThemeData(
        primaryColor: KhiyaarPalette.green,
        accentColor: KhiyaarPalette.green,
      ),
      home: new LauncherPage(),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (BuildContext context) => LauncherPage(),
        DetalleDelPost.routeName: (BuildContext context) => DetalleDelPost(),
      },
    );
  }
}
