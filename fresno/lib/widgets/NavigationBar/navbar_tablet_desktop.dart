import 'package:flutter/material.dart';
import 'package:fresno/routing/route_names.dart';
import 'package:fresno/widgets/NavigationBar/navbar_item.dart';
import 'package:fresno/widgets/NavigationBar/navbar_logo.dart';

class NavigationBarTabletDesktop extends StatelessWidget {
  const NavigationBarTabletDesktop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
         NavBarLogo(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              NavBarItem('Home',HomeRoute),
              SizedBox(
                width: 60,
              ),
              NavBarItem('Rent', RentRoute),
            ],
          ),
        ],
      ),
      );
  }
}
