import 'package:flutter/material.dart';
import 'package:fresno/widgets/details/details.dart';

class HomeContentDesktop extends StatelessWidget {
  const HomeContentDesktop({Key  key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Details(),
        /*Expanded(
          child: Center(
            child: CallToAction('Join Course'),
          ),
        )*/
      ],
    );
  }
}