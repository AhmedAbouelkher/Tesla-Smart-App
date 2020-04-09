import 'package:flutter/material.dart';

import 'package:tesla_smart_app/screens/bottom_sheet.dart';

class InformationCard extends StatefulWidget {
  InformationCard({this.cardStatus, this.cardTitle});
  final List<String> cardStatus;
  final String cardTitle;
  @override
  _InformationCardState createState() => _InformationCardState();
}

class _InformationCardState extends State<InformationCard> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        margin: EdgeInsets.only(left: 20),
        height: 100,
        width: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(response.setHeight(5)),
          color: Color(0xff1C1F24),
          boxShadow: [
            BoxShadow(
              color: Colors.transparent,
              blurRadius: 8,
              spreadRadius: 4,
              offset: Offset(-0.1, -0.1),
            )
          ],
        ),
        child: Stack(
          overflow: Overflow.clip,
          children: <Widget>[
            Positioned(
              left: 10,
              top: 10,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: isSelected ? Colors.blue : Colors.transparent,
                      blurRadius: 3,
                      spreadRadius: 0.4,
                    )
                  ],
                ),
                child: CircleAvatar(
                  backgroundColor:
                      isSelected ? Colors.blue : Colors.transparent,
                  radius: 1.5,
                ),
              ),
            ),
            Positioned(
              left: 8,
              bottom: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.cardTitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: response.setHeight(1)),
                  Text(
                    isSelected ? widget.cardStatus[0] : widget.cardStatus[1],
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
