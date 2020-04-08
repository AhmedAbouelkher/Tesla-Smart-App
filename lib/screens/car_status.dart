import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:tesla_smart_app/Response.dart';
import 'package:tesla_smart_app/widgets/button.dart';
import 'package:tesla_smart_app/widgets/raw_expandable_bottom_sheet.dart';
import 'package:tesla_smart_app/widgets/temprature_slider.dart';
import 'package:tesla_smart_app/widgets/bottom_sheet.dart';

var response = ResponseUI();

class CarStatusDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHieght = MediaQuery.of(context).size.height;
    double screeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff353A40),
      body: SafeArea(
        left: false,
        right: false,
        child: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                Header(),
                Image.asset(
                  "assets/images/details_page.png",
                  scale: 2.2,
                ),
                PageContent(),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomBottomSheet(),
            ),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RoundedButton(
            buttonRadius: response.setHeight(22),
            icon: FontAwesomeIcons.stream,
            iconSize: response.setHeight(13),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Column(
            children: <Widget>[
              Text(
                "Tesla",
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: response.setFontSize(15),
                    fontWeight: FontWeight.normal),
              ),
              Text(
                "Cybertruck",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: response.setFontSize(15),
                    fontWeight: FontWeight.w900),
              ),
            ],
          ),
          RoundedButton(
            buttonRadius: response.setHeight(22),
            icon: FontAwesomeIcons.user,
            iconSize: response.setHeight(13),
          ),
        ],
      ),
    );
  }
}

class PageContent extends StatelessWidget {
  const PageContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: response.setWidth(30)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Status",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: response.setFontSize(20),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: response.setHeight(15)),
              Row(
                children: <Widget>[
                  StatusWidget(
                    icon: Transform.rotate(
                      angle: -pi / 2,
                      child: FaIcon(
                        FontAwesomeIcons.batteryHalf,
                        size: 12,
                        color: Colors.white70,
                      ),
                    ),
                    content: '54%',
                    title: 'Battery',
                  ),
                  StatusWidget(
                    icon: FaIcon(
                      FontAwesomeIcons.locationArrow,
                      size: 12,
                      color: Colors.white70,
                    ),
                    content: '297 km',
                    title: 'Range',
                  ),
                  StatusWidget(
                    icon: FaIcon(
                      FontAwesomeIcons.temperatureHigh,
                      size: 13,
                      color: Colors.white70,
                    ),
                    content: '27°C',
                    title: 'Temprature',
                  ),
                ],
              )
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  left: response.setWidth(30),
                  top: response.setHeight(30),
                  bottom: response.setHeight(10)),
              child: Text(
                "Information",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: response.setFontSize(20),
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: response.setHeight(5)),
            Container(
              constraints: BoxConstraints(
                maxHeight: 110,
              ),
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  InformationCard(
                    cardStatus: ['Running mode', 'Sleeping mode'],
                    cardTitle: 'Engine',
                  ),
                  InformationCard(
                    cardStatus: ['A/C is ON', 'A/C is OFF'],
                    cardTitle: 'Climate',
                  ),
                  InformationCard(
                    cardStatus: ['Low pressure', 'High pressure'],
                    cardTitle: 'Tiers',
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}

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
            // Positioned(
            //   right: 30,
            //   bottom: -10,
            //   child: Container(
            //     height: 100,
            //     width: 100,
            //     decoration: BoxDecoration(
            //       // shape: BoxShape.circle,
            //       gradient: LinearGradient(
            //         end: Alignment.topLeft,
            //         begin: Alignment.bottomRight,
            //         stops: [0.1, 0.9],
            //         colors: [
            //           Colors.white.withAlpha(100),
            //           Colors.black
            //           // Color(0xff1A1E21),
            //           // Color(0xff15171A),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // Positioned(
            //   left: 40,
            //   top: 40,
            //   child: Container(
            //     height: 100,
            //     width: 100,
            //     decoration: BoxDecoration(
            //       // shape: BoxShape.circle,
            //       gradient: LinearGradient(
            //         end: Alignment.topCenter,
            //         begin: Alignment.bottomCenter,
            //         // stops: [0.1, 0.9],
            //         colors: [
            //           Colors.white,
            //           Colors.black
            //           // Color(0xff1A1E21),
            //           // Color(0xff15171A),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
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

class StatusWidget extends StatelessWidget {
  const StatusWidget({
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
