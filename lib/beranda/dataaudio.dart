import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

void main() {
  runApp(new MaterialApp(
    title: "My Apps",
    home: new HalamanJson(),
  ));
}

class HalamanJson extends StatefulWidget {
  @override
  _HalamanJsonState createState() => _HalamanJsonState();
}

class _HalamanJsonState extends State {
  List datadariJSON;

  Future ambildata() async {
    http.Response hasil = await http.get(
        Uri.encodeFull("https://www.khiyaar.com/audiokajian/json.php"),
        headers: {"Accept": "application/json"});

    this.setState(() {
      datadariJSON = json.decode(hasil.body);
    });
  }

  @override
  void initState() {
    this.ambildata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data JSON"),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: datadariJSON == null ? 0 : datadariJSON.length,
            itemBuilder: (context, i) {
              return ListTile(
                title: Text(datadariJSON[i]['judul']),
              );
            }),
      ),
    );
  }
}
