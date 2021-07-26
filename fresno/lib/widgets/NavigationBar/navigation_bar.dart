import 'package:flutter/material.dart';

import 'package:fresno/widgets/NavigationBar/navbar_mobile.dart';
import 'package:fresno/widgets/NavigationBar/navbar_tablet_desktop.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({Key  key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: NavigationBarMobile(),
      tablet: NavigationBarTabletDesktop(),
    );
  }
}
