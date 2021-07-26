import 'package:flutter/material.dart';
import 'package:fresno/locator.dart';
import 'package:fresno/nav_drawer/nav_drawer.dart';
import 'package:fresno/routing/route_names.dart';
import 'package:fresno/routing/router.dart';
import 'package:fresno/services/navigation_service.dart';
import 'package:fresno/widgets/NavigationBar/navigation_bar.dart';
import 'package:fresno/widgets/centered_view/centered_view.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LayoutTemplate extends StatelessWidget {
  const LayoutTemplate({Key  key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(

      builder: (context, sizingInformation) => Scaffold(
        drawer: sizingInformation.deviceScreenType == DeviceScreenType.mobile
            ? NavigationDrawer()
            : null,

      backgroundColor: Colors.white,
      body: CenteredView(
        child: Column(
          children: <Widget>[
            NavigationBar(),
            Expanded(child: Navigator(
              key: locator<NavigationService>().navigatorKey,
                onGenerateRoute: generateRoute,
                initialRoute: HomeRoute,
           )
           
            )
          ],
        ),
      ),
      ),
    );
  }
}