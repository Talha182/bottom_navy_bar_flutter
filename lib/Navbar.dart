import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:finance_app/Page1.dart';
import 'package:finance_app/Page2.dart';
import 'package:finance_app/Page3.dart';
import 'package:finance_app/Page4.dart';
import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    @override
    void dispose() {
      _pageController.dispose();
      super.dispose();
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            Page1(),
            Page2(),
            Page3(),
            Page4(),

          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        curve: Curves.linear,
        iconSize: 20.0,
        backgroundColor: Colors.white,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              title: Text('Item One',style: TextStyle(color: Colors.black54),),
              icon: Icon(Icons.home,color: Colors.black54,)
          ),
          BottomNavyBarItem(
              title: Text('Item Two',style: TextStyle(color: Colors.black54),),
              icon: Icon(Icons.apps,color: Colors.black54,)
          ),
          BottomNavyBarItem(
              title: Text('Item Three',style: TextStyle(color: Colors.black54),),
              icon: Icon(Icons.chat_bubble,color: Colors.black54,)
          ),
          BottomNavyBarItem(
              title: Text('Item Four',style: TextStyle(color: Colors.black54),),
              icon: Icon(Icons.settings,color: Colors.black54,)
          ),
        ],
      ),
    );
  }
}

