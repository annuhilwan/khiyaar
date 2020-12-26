import 'package:flutter/material.dart';

class Categorias extends StatelessWidget {
  const Categorias({Key key}) : super(key: key);
  static const routeName = 'paginadecategorias';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Categorias')),
      body: ListView(
        children: <Widget>[
          Center(child: Text('aqui estoy')),
        ],
      ),
    );
  }
}
