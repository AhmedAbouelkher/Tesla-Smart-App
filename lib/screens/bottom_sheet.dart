import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:response/Response.dart';
import 'package:tesla_smart_app/widgets/button.dart';
import 'package:tesla_smart_app/widgets/temprature_slider.dart';
import 'package:tesla_smart_app/widgets/mode.dart';
import 'package:tesla_smart_app/widgets/fan_speed_slider.dart';

var response = ResponseUI();

class CustomBottomSheet extends StatefulWidget {
  @override
  _CustomBottomSheetState createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  bool isBottomSheetExpaded = false;

  @override
  Widget build(BuildContext context) {
    return ExpandableBottomSheet(
      onIsExtendedCallback: () {
        setState(() {
          isBottomSheetExpaded = true;
        });
      },
      onIsContractedCallback: () {
        setState(() {
          isBottomSheetExpaded = false;
        });
      },
      persistentHeader: Container(
        height: 99,
        decoration: BoxDecoration(
            color: Color(0xff32373B),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(response.setHeight(45)),
              topRight: Radius.circular(response.setHeight(45)),
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, -0.5),
                color:
                    isBottomSheetExpaded ? Colors.transparent : Colors.black38,
                blurRadius: 8,
                spreadRadius: 3,
              )
            ]),
        child: Column(
          children: <Widget>[
            SizedBox(height: response.setHeight(2)),
            Divider(
              color: Colors.black,
              thickness: 2.5,
              endIndent: response.screenWidth * 0.44,
              indent: response.screenWidth * 0.44,
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: response.screenWidth * 0.09),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'A/C is ON',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: response.setFontSize(18),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: response.setHeight(5)),
                      isBottomSheetExpaded
                          ? Text(
                              'Currently 27°C\nWill change in 2min',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: response.setFontSize(13),
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          : Text(
                              'Tap to turn off or swipe up\nfor a fast setup',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: response.setFontSize(13),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    ],
                  ),
                  RoundedButton(
                    buttonRadius: 30,
                    isMain: true,
                    icon: FontAwesomeIcons.powerOff,
                    iconSize: 15,
                    iconColor: Colors.white,
                    activeColors: [Color(0xff0FA0F3), Color(0xff0063A8)],
                    blackOpacity: 0.7,
                  )
                ],
              ),
            )
          ],
        ),
      ),
      expandableContent: Container(
        height: response.screenHeight * 0.72,
        color: Color(0xff32373B),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TempratureSlider(),
                SizedBox(height: response.setHeight(30)),
                Text(
                  'Fan speed\n',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: response.setFontSize(20),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: response.setWidth(10)),
                  child: FanSpeedSlider(),
                ),
                SizedBox(height: response.setHeight(10)),
                Text(
                  'Mode',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: response.setHeight(20),
                      fontWeight: FontWeight.w700),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: response.setWidth(30),
                      vertical: response.setHeight(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Mode(
                        title: "Auto",
                        isMain: true,
                        child: Center(
                          child: Text(
                            "A",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: response.setFontSize(18),
                            ),
                          ),
                        ),
                      ),
                      Mode(
                        title: "Dry",
                        icon: FontAwesomeIcons.wind,
                      ),
                      Mode(
                        title: "Cool",
                        icon: FontAwesomeIcons.stroopwafel,
                      ),
                      Mode(
                        title: "Program",
                        icon: FontAwesomeIcons.stopwatch,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
