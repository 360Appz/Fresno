import 'package:flutter/material.dart';
import 'package:fresno/widgets/details/details.dart';

class HomeContentMobile extends StatelessWidget {
  const HomeContentMobile({Key  key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Details(),
        //SizedBox(height: 100,),
       
      ],
    );
  }
}