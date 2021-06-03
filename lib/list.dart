import 'package:flutter/cupertino.dart';

class ListPlat extends StatefulWidget {
  @override
  _ListPlatState createState() => _ListPlatState();
}

class _ListPlatState extends State<ListPlat> {
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8),
        alignment: Alignment.center,
        height: double.infinity,
        width: double.infinity,
        child: Text("data"));
  }
}
