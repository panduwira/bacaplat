import 'package:bacaplat/plat_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListPlat extends StatefulWidget {
  @override
  _ListPlatState createState() => _ListPlatState();
}

var i;

class _ListPlatState extends State<ListPlat> {
  Widget build(BuildContext context) {
    i = 0;
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      height: double.infinity,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("plat").snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text("Failed to get products data!");
            }

            if (snapshot.data == null) return CircularProgressIndicator();

            return DataTable(columns: [
              DataColumn(label: Text('No')),
              DataColumn(label: Text('Plat')),
              DataColumn(label: Text('Date')),
            ], rows: _buildList(context, snapshot.data.docs));
          },
        ),
      ),
    );
  }

  List<DataRow> _buildList(
      BuildContext context, List<DocumentSnapshot> snapshot) {
    return snapshot.map((DocumentSnapshot doc) {
      i = i + 1;
      return DataRow(cells: [
        DataCell(Text(i.toString())),
        DataCell(Text(doc.get('plat'))),
        DataCell(Text(doc.get('date'))),
      ]);
    }).toList();
  }
}
