import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';


class Details extends StatelessWidget {
  const Details({Key key}) : super(key: key);

  @override //Child class overrides parent class
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation)
    {
       var textAlignment = sizingInformation.deviceScreenType == DeviceScreenType.desktop
              ? TextAlign.left
              : TextAlign.center;

       double titleSize =
          sizingInformation.deviceScreenType == DeviceScreenType.mobile
              ? 50
              : 80;
      double descriptionSize = sizingInformation.deviceScreenType == DeviceScreenType.mobile ?
      16 : 21;       
    
    return Container(
      width: 600,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Fresno',
            style: TextStyle(
                fontWeight: FontWeight.w800, fontSize: titleSize, 
                height: 0.9),
                textAlign: textAlignment,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Welcome to this blockchain based bicycle renting app. We hope that you enjoy the experience here !!',
            style: TextStyle(fontSize: descriptionSize, 
            height: 1.7),
           
          )
         ],
        ),
      );
    });
  }
}