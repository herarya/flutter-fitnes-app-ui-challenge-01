import 'package:flutter/material.dart';
import 'package:flutter_fitnes_app/home.dart';

class CustomButtonBar extends StatelessWidget {
  final List<BottomNavigationBarItem> bottomBarItems = [];

  final bottomNavigationBarItemStyle =
      TextStyle(fontStyle: FontStyle.normal, color: Colors.black);

  CustomButtonBar() {
    bottomBarItems.add(
      BottomNavigationBarItem(
        icon: Icon(
          Icons.show_chart,
          color: appTheme.primaryColor,
        ),
        title: Container(
          height: 0.0,
          child: Text(""),
        ),
      ),
    );
   bottomBarItems.add(
      BottomNavigationBarItem(
        icon: Icon(
          Icons.search,
        ),
        title: Container(
          height: 0.0,
          child: Text(""),
        ),
      ),
    );
    bottomBarItems.add(
      BottomNavigationBarItem(
        icon: Icon(
          Icons.notifications,
        ),
        title: Container(
          height: 0.0,
          child: Text(""),
        ),
      ),
    );
   bottomBarItems.add(
      BottomNavigationBarItem(
        icon: Icon(
          Icons.person,
        ),
        title: Container(
          height: 0.0,
          child: Text(""),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 15.0,
      child: BottomNavigationBar(
        items: bottomBarItems,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
