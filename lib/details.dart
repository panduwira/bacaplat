import 'package:bacaplat/main.dart';
import 'package:bacaplat/modelPlat.dart';
import 'package:bacaplat/plat_services.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final String text;
  final String date;
  Details(this.text, this.date);
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text('Details'),
        actions: [
          TextButton(
            child: Text("Save"),
            onPressed: () {
              FlutterClipboard.copy(widget.text).then((value) => _key
                  .currentState
                  .showSnackBar(new SnackBar(content: Text('Saved'))));
              PlatNomor platNomor = PlatNomor('', widget.text, widget.date);
              PlatServices.addData(platNomor);
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        alignment: Alignment.center,
        height: double.infinity,
        width: double.infinity,
        child: SelectableText(
            widget.text.isEmpty ? 'No Text Available' : widget.text),
      ),
    );
  }
}
