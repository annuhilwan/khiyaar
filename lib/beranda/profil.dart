import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:khiyaar/api/profilapi.dart';
import 'package:khiyaar/constant.dart';
import 'package:khiyaar/beranda/beranda_khiyaar_appbar.dart';
import 'package:khiyaar/screens/post.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textiTheme = Theme.of(context).textTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Khiyaar',
      theme: new ThemeData(
        primaryColor: KhiyaarPalette.green,
        accentColor: KhiyaarPalette.green,
      ),
      home: Profil(),
      initialRoute: Profil.routeName,
      routes: {
        Profil.routeName: (BuildContext context) => Profil(),
        DetalleDelPost.routeName: (BuildContext context) => DetalleDelPost()
      },
    );
  }
}

class Profil extends StatelessWidget {
  const Profil({Key key}) : super(key: key);
  static const routeName = '/Profil';

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
        child: Scaffold(
      appBar: new KhiyaarAppBar(),
      body: ListView(
        children: [
          Text(
            'PROFIL',
            style: new TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          FutureBuilder(
            future: lugares(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                var pages = snapshot.data;
                return Column(children: [
                  ...pages.map((e) {
                    return GestureDetector(
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * 0.95,
                            padding: EdgeInsets.all(20),
                            margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                            child: Column(
                              children: <Widget>[
                                FadeInImage(
                                  placeholder: AssetImage('assets/loading.gif'),
                                  image: NetworkImage(e["_embedded"]
                                              ["wp:featuredmedia"][0]
                                          ["media_details"]["sizes"]
                                      ["medium_large"]["source_url"]),
                                ),
                                Text(
                                  parse(e['content']['rendered'])
                                      .documentElement
                                      .text,
                                  style: new TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.justify,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ]);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    ));
  }
}
