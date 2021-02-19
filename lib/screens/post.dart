import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html/parser.dart';
import 'package:khiyaar/beranda/detail_khiyaar_appbar.dart';
import 'package:share/share.dart';

class DetalleDelPost extends StatelessWidget {
  const DetalleDelPost({Key key}) : super(key: key);

  static const routeName = '/DetalleDelPost';

  void share(BuildContext context) {
    Map post = ModalRoute.of(context).settings.arguments as Map;
    var jdl = post['title']['rendered'];
    var desc = post['content']['rendered'];
    var url = desc;
    var foot =
        "Share agar lebih bermanfaat Baca selengkapnya di aplikasi Khiyar, download di https://play.google.com";
    final RenderBox box = context.findRenderObject();

    Share.share("$url $foot",
        subject: "Khiyaar | Beradab, Berilmu, Beramal - $jdl",
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  @override
  Widget build(BuildContext context) {
    Map post = ModalRoute.of(context).settings.arguments as Map;
    return new SafeArea(
      child: Scaffold(
        appBar: new KhiyaarAppBar(),
        body: ListView(children: <Widget>[
          FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: NetworkImage(post["_embedded"]["wp:featuredmedia"][0]
                ["media_details"]["sizes"]["medium_large"]["source_url"]),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              post['title']['rendered'],
              style: GoogleFonts.poppins(
                  textStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
            ),
          ),
          HtmlWidget(post['content']['rendered']),
          new SizedBox(
              width: 200.0,
              height: 40.0,
              child: RaisedButton(
                child: Icon(
                  Icons.share,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () {
                  share(context);
                },
                color: Colors.blue,
              ))
        ]),
      ),
    );
  }
}
