import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListPlat extends StatefulWidget {
  @override
  _ListPlatState createState() => _ListPlatState();
}

class _ListPlatState extends State<ListPlat> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List")),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: [
                DataColumn(label: Text('RollNo')),
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Class')),
                DataColumn(label: Text('Hello')),
                DataColumn(label: Text('World')),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('Arya')),
                  DataCell(Text('6')),
                  DataCell(Text('Arya')),
                  DataCell(Text('6')),
                ]),
                DataRow(cells: [
                  DataCell(Text('12')),
                  DataCell(Text('John')),
                  DataCell(Text('9')),
                  DataCell(Text('Arya')),
                  DataCell(Text('6')),
                ]),
                DataRow(cells: [
                  DataCell(Text('42')),
                  DataCell(Text('Tony')),
                  DataCell(Text('8')),
                  DataCell(Text('Arya')),
                  DataCell(Text('6')),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
