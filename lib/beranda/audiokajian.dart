import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'player_widget.dart';
import 'package:http/http.dart';
import 'package:khiyaar/beranda/beranda_khiyaar_appbar.dart';
import 'package:khiyaar/api/audiokajianapi.dart';
import 'dart:core';

const kUrl1 = 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3';
const kUrl2 = 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3';
const kUrl3 = 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3';

//const kUrl3 = 'http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio1xtra_mf_p';
final List<String> urls = [kUrl1, kUrl2, kUrl3];

void main() {
  runApp(MaterialApp(home: ExampleApp()));
}

class ExampleApp extends StatefulWidget {
  @override
  _ExampleAppState createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  String localFilePath;

  Widget _tab(List<Widget> children) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: children
              .map((w) => Container(child: w, padding: EdgeInsets.all(6.0)))
              .toList(),
        ),
      ),
    );
  }

  Widget remoteUrl() {
    return SingleChildScrollView(
      child: _tab([
        FutureBuilder(
          future: lugares(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              var posts = snapshot.data;
              return Column(children: [
                ...posts.map((e) {
                  return GestureDetector(
                    child: Row(
                      children: <Widget>[
                        FadeInImage(
                          placeholder: AssetImage('assets/loading.gif'),
                          image: NetworkImage(e['link_gambar']),
                          height: 100.0,
                          width: 100.0,
                        ),
                        Container(
                          width: 250,
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                e['judul'],
                                style: new TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              PlayerWidget(url: e['link_audio'])
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ]);
            } else {
              return Center(child: CircularProgressIndicator());
            }
            ;
          },
        ),
      ]),
    );
  }

  Widget _btn(String txt, VoidCallback onPressed) {
    return ButtonTheme(
      minWidth: 48.0,
      child: RaisedButton(child: Text(txt), onPressed: onPressed),
      buttonColor: Colors.blue,
    );
  }

  Future<void> _loadFile() async {
    final bytes = await readBytes(kUrl1);
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/audio.mp3');

    await file.writeAsBytes(bytes);
    if (await file.exists()) {
      setState(() {
        localFilePath = file.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      child: Scaffold(
        appBar: new KhiyaarAppBar(),
        body: Row(
          children: [
            remoteUrl(),
          ],
        ),
      ),
    );
  }
}
