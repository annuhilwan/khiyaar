import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class KhiyaarAppBar extends AppBar {
  KhiyaarAppBar()
      : super(
            elevation: 0.25,
            backgroundColor: Colors.white,
            flexibleSpace: _buildKhiyaarAppBar());

  static Widget _buildKhiyaarAppBar() {
    @override
    Widget sosmedSection = new Container(
      padding: EdgeInsets.only(top: 25, left: 15),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          InkWell(
            onTap: () => launch('https://www.khiyaar.com'),
            child: Image.asset(
              "assets/world-wide-web.png",
              height: 20.0,
              width: 20.0,
            ),
          ),
          InkWell(
            onTap: () => launch(
                'https://www.youtube.com/channel/UCrU4wEVdCdSRfXWeQXkg2Tw'),
            child: Image.asset(
              "assets/youtube.png",
              height: 20.0,
              width: 20.0,
            ),
          ),
          InkWell(
            onTap: () => launch('https://web.facebook.com/khiyaartv/'),
            child: Image.asset(
              "assets/facebook.png",
              height: 20.0,
              width: 20.0,
            ),
          ),
          InkWell(
            onTap: () => launch('https://www.instagram.com/khiyaartv/'),
            child: Image.asset(
              "assets/instagram.png",
              height: 20.0,
              width: 20.0,
            ),
          ),
          InkWell(
            onTap: () => launch('mailto:tabungan.akhirat001@gmail.com'),
            child: Image.asset(
              "assets/gmail.png",
              height: 20.0,
              width: 20.0,
            ),
          ),
        ],
      ),
    );

    return new Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Image.asset(
            "assets/logos-khiyaar.png",
            height: 100.0,
            width: 150.0,
          ),
          new Container(
            child: new Stack(
              children: <Widget>[
                new Container(
                  margin: EdgeInsets.only(
                      left: 0.0, right: 0.0, top: 0.0, bottom: 15.0),
                  padding: EdgeInsets.all(6.0),
                  child: new Text(
                    "Media Resmi Kami \n",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 12.0),
                  ),
                ),
                sosmedSection
              ],
            ),
          ),
        ],
      ),
    );
  }
}
