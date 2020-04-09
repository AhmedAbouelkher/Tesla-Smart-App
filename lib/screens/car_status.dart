import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:response/Response.dart';
import 'package:tesla_smart_app/widgets/button.dart';
import 'package:tesla_smart_app/screens/bottom_sheet.dart';
import 'package:tesla_smart_app/widgets/inforamtion_card.dart';
import 'package:tesla_smart_app/widgets/status_chip.dart';
import 'package:tesla_smart_app/widgets/navigation_map.dart';

var response = ResponseUI();

class CarStatusDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  scale: response.screenHeight / 350,
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
                  StatusChip(
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
                  StatusChip(
                    icon: FaIcon(
                      FontAwesomeIcons.locationArrow,
                      size: 12,
                      color: Colors.white70,
                    ),
                    content: '297 km',
                    title: 'Range',
                  ),
                  StatusChip(
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
                  InformationCard(
                    cardStatus: ['Online mode', 'Offline mode'],
                    cardTitle: 'Auto pilot',
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: response.setHeight(30)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: response.setWidth(30)),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Navigation",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: response.setFontSize(20),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "History",
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: response.setFontSize(15),
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              SizedBox(height: response.setHeight(20)),
              NavigationMap(
                latitude: 51.5,
                longitude: -0.01,
                // zoom: 20,
              ),
            ],
          ),
        )
      ],
    );
  }
}
