import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../main.dart';
import './mapScreen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  static const routeName = '/tabs';
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Widget> _pages = [
    HomePage(),
    Mapscreen(),
  ];
  int _selectPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white24,
      body: _pages[_selectPageIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectPageIndex,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.black,
          onTap: _selectPage,
          items: [
            BottomNavigationBarItem(
                backgroundColor:
                    Color.fromRGBO(114, 112, 109, 1).withOpacity(0.985),
                icon: Icon(FontAwesomeIcons.lightbulb),
                label: 'Distress'),
            BottomNavigationBarItem(
                backgroundColor:
                    Color.fromRGBO(114, 112, 109, 1).withOpacity(0.985),
                icon: Icon(FontAwesomeIcons.mapLocation),
                label: 'Safe route'),
          ]),
    );
  }
}
