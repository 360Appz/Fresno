import 'package:flutter/material.dart';
import 'package:fresno/services/navigation_service.dart';
import '../../locator.dart';



//Styling for Navigation panel
class NavBarItem extends StatelessWidget {
  final String title;
  final String navigationPath;
  const NavBarItem( 
    this.title, this.navigationPath);


//Able to construct without providing a key
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     onTap: (){
       locator<NavigationService>().navigateTo(navigationPath);
     },
      child: Text(
        title,
        style: TextStyle(fontSize: 18)
        ),
    );
  }
}