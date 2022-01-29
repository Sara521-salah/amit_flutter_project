import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:movice/categories.dart';
import 'package:movice/loginScreen.dart';
import 'package:movice/products.dart';
import 'package:movice/registerScreen.dart';
import 'package:movice/settingScreen.dart';
import 'package:provider/provider.dart';

import 'caet.dart';
import 'logic/api.dart';




class HomeLayout extends StatefulWidget {

  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int _currentIndex = 1;
  var screens = [
     Categories(),
    Products(),
     const Setting()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create:  (BuildContext context)=>MyProvider(),
          child: screens[_currentIndex]),

      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => _currentIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(

            icon: const Icon(Icons.shop),
            title: const Text('Categories'),
            activeColor: Colors.teal,
            textAlign: TextAlign.center,
            inactiveColor: Colors.black54,

          ),
          BottomNavyBarItem(
            icon: Icon(Icons.shopping_bag),
            title: Text('Products'),
            activeColor: Colors.teal,
            textAlign: TextAlign.center,
            inactiveColor: Colors.black54,

          ),

          BottomNavyBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
            activeColor: Colors.teal,
            inactiveColor: Colors.black54,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}