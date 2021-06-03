import 'package:bacaplat/foto.dart';
import 'package:bacaplat/list.dart';
import 'package:flutter/material.dart';

main() async {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    Foto(),
    ListPlat(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.photo),
              label: ("Take Photo"),
              backgroundColor: Colors.orange),
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: ("List"),
              backgroundColor: Colors.orange)
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        onTap: _onItemTapped,
      ),
    );
  }
}
