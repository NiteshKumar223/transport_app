import 'package:flutter/material.dart';

import '../utils/colors.dart';
import 'page_list.dart';
import 'page_profile.dart';


class PageMyHome extends StatefulWidget {
  const PageMyHome({super.key});

  @override
  State<PageMyHome> createState() => _PageMyHomeState();
}

class _PageMyHomeState extends State<PageMyHome> {

  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    PageList(),
    PageProfile()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: const Text("Ghaat Transport",
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w500
          ),
        ),
      ),
      body: Container(
        height: screensize.height,
        width: screensize.width,
        color: colorwhite,
        child: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: colorprimary,
        currentIndex: _selectedIndex,
        selectedItemColor: colorwhite,
        onTap: _onItemTapped,
        iconSize: 26,
        selectedFontSize : 16.0,
        unselectedFontSize : 14.0,
        elevation: 50.0,


        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list_sharp),
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_sharp),
            label: 'Profile',
          ),
        ],
        
      ),
    );
  }
}
