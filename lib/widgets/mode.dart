import 'package:flutter/material.dart';
import 'package:tesla_smart_app/widgets/button.dart';

import 'package:tesla_smart_app/screens/bottom_sheet.dart';

class Mode extends StatelessWidget {
  const Mode({
    Key key,
    this.title,
    this.icon,
    this.isMain = false,
    this.iconSize = 18,
    this.child,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final bool isMain;
  final double iconSize;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
              fontSize: response.setHeight(16), color: Colors.white60),
        ),
        SizedBox(height: response.setHeight(10)),
        RoundedButton(
          buttonRadius: response.setHeight(30),
          isMain: isMain,
          activeColors: isMain
              ? [Color(0xff0FA0F3), Color(0xff0063A8)]
              : [Color(0xff191b1c), Color(0xff464a4d)],
          icon: icon,
          iconSize: iconSize,
          child: child,
        )
      ],
    );
  }
}
