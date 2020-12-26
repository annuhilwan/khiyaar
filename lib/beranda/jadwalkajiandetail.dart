import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class DetalleDelPost extends StatelessWidget {
  const DetalleDelPost({Key key}) : super(key: key);

  static const routeName = 'jadwalKajian/detalleDelPost';

  @override
  Widget build(BuildContext context) {
    Map post = ModalRoute.of(context).settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(title: Text(post['title']['rendered'])),
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
          ),
        ),
        HtmlWidget(post['content']['rendered'])
      ]),
    );
  }
}
