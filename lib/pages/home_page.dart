import 'package:flutter/material.dart';
import 'package:flutter_bottom_navigation_bar/pages/display_container.dart';
import 'package:flutter_bottom_navigation_bar/pages/list_page.dart';
import 'package:flutter_bottom_navigation_bar/pages/profile_page.dart';
import 'package:flutter_bottom_navigation_bar/pages/search_page.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  List<Widget> tabs = [
    DisplayContainer(Center(child: Icon(Icons.home))),
    DisplayContainer(SearchPage()),
    DisplayContainer(ListPage()),
    DisplayContainer(ProfilePage())
  ];
  List<String> titles = [
    'Home',
    'Search',
    'List',
    'Profile',
  ];

  Widget getContentHome() {
    return Center(
      child: Icon(Icons.home),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[currentIndex]),
        centerTitle: true,
      ),
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: _onTabTapped,
        fixedColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), title: Text('Search')),
          BottomNavigationBarItem(icon: Icon(Icons.list), title: Text('List')),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text('Profile')),
        ],
      ),
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
