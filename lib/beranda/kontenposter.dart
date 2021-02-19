import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:khiyaar/api/kontenposterapi.dart';
import 'package:khiyaar/constant.dart';
import 'package:khiyaar/screens/post.dart';
import 'package:khiyaar/beranda/beranda_khiyaar_appbar.dart';

void main() => runApp(MyApps());

class MyApps extends StatelessWidget {
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
      home: KontenPoster(),
      initialRoute: KontenPoster.routeName,
      routes: {
        KontenPoster.routeName: (BuildContext contex) => KontenPoster(),
        DetalleDelPost.routeName: (BuildContext context) => DetalleDelPost(),
      },
    );
  }
}

class KontenPoster extends StatelessWidget {
  const KontenPoster({Key key}) : super(key: key);
  static const routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
        child: Scaffold(
      appBar: new KhiyaarAppBar(),
      body: ListView(
        children: [
          Text(
            'KONTEN POSTER',
            style: new TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          FutureBuilder(
            future: lugares(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                var posts = snapshot.data;
                return Column(children: [
                  ...posts.map((e) {
                    String date = e['date'].substring(0, 10);
                    var dates = DateTime.parse(date);
                    var datess =
                        "${dates.day} - ${dates.month} - ${dates.year}";
                    return GestureDetector(
                      onTap: () => Navigator.of(context)
                          .pushNamed(DetalleDelPost.routeName, arguments: e),
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5.0),
                        padding: EdgeInsets.all(10.0),
                        height: 170.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0, 1),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child: Row(
                          children: <Widget>[
                            FadeInImage(
                              placeholder: AssetImage('assets/loading.gif'),
                              image: NetworkImage(e['_embedded']
                                  ['wp:featuredmedia'][0]['source_url']),
                              height: 100.0,
                              width: 100.0,
                            ),
                            Container(
                              width: 230,
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    e['title']['rendered'],
                                    style: new TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    '$datess',
                                    style: new TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.blue,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                      parse(e['content']['rendered'])
                                          .documentElement
                                          .text,
                                      maxLines: 4,
                                      style: new TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.blue,
                                      ),
                                      textAlign: TextAlign.left)
                                ],
                              ),
                            ),
                          ],
                        ),
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
      backgroundColor: Colors.blue,
    ));
  }
}
