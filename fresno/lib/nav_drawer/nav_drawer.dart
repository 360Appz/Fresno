import 'package:flutter/material.dart';
import 'package:fresno/nav_drawer/drawer_item.dart';
import 'package:fresno/nav_drawer/nav_drawer_header.dart';
import 'package:fresno/routing/route_names.dart'; 

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key  key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 16)]),
      child: Column(
        children: <Widget>[
          NavigationDrawerHeader(),
          DrawerItem('Home' , Icons.home, HomeRoute),
          DrawerItem('Rent', Icons.electric_bike, RentRoute),
        ],
      ),
    );
  }
}