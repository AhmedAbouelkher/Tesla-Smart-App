import 'package:flutter/material.dart';

import 'package:tesla_smart_app/screens/bottom_sheet.dart';

class StatusChip extends StatelessWidget {
  const StatusChip({
    Key key,
    this.title,
    this.content,
    this.icon,
  }) : super(key: key);
  final String title;
  final String content;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: response.setWidth(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          icon,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                " " + title,
                style: TextStyle(
                  color: Colors.white70.withAlpha(150),
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: response.setHeight(5)),
              Text(
                content,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
