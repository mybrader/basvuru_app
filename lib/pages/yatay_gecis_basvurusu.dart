import 'package:flutter/material.dart';

class YatayGecis extends StatefulWidget {
  @override
  _YatayGecisState createState() => _YatayGecisState();
}

class _YatayGecisState extends State<YatayGecis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Yatay Geçiş Başvuru Sayfası")),
      ),
      body: Center(child: Text("Yatay Geçiş Sayfası")),
    );
  }
}
