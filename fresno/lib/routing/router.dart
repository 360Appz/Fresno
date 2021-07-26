import 'package:fresno/main.dart';
import 'package:fresno/routing/route_names.dart';
import 'package:fresno/views/home/home.dart';
import 'package:flutter/material.dart';
//import 'package:fresno/views/rent/rent.dart';


Route<dynamic> generateRoute(RouteSettings settings) {
  print('generateRoute: ${settings.name}');
  switch (settings.name) {
    case HomeRoute:
      return _getPageRoute(HomeView());
    
    case RentRoute:
    //Rent view code
      return _getPageRoute(MyHomePage());//RentView
    default:
      return _getPageRoute(HomeView());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(
    builder: (context) => child,
  );
}

class FadeRoute extends PageRouteBuilder {
  final Widget child;
  FadeRoute({this.child})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}

