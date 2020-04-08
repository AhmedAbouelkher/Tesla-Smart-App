import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tesla_smart_app/Response.dart';
import 'package:tesla_smart_app/widgets/button.dart';
import 'package:tesla_smart_app/widgets/raw_expandable_bottom_sheet.dart';
import 'package:tesla_smart_app/widgets/temprature_slider.dart';

var response = ResponseUI();

class CustomBottomSheet extends StatefulWidget {
  @override
  _CustomBottomSheetState createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  bool expaded = false;

  @override
  Widget build(BuildContext context) {
    return ExpandableBottomSheet(
      onIsExtendedCallback: () {
        setState(() {
          expaded = true;
        });
      },
      onIsContractedCallback: () {
        setState(() {
          expaded = false;
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
          // gradient: expaded
          //     ? null
          //     : LinearGradient(
          //         end: Alignment.topCenter,
          //         begin: Alignment.bottomCenter,
          //         colors: [
          //           Color(0xff17181C),
          //           Color(0xff212227),
          //           Color(0xff282B30)
          //         ],
          //       ),
        ),
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
                      expaded
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
          child: Column(
            children: <Widget>[
              TempratureSlider(),
              SizedBox(height: response.setHeight(30)),
              Text(
                'Fan speed\n',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w800),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: FanSpeedSlider(),
              ),
              SizedBox(height: response.setHeight(10)),
              Text(
                'Mode',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w800),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: response.setWidth(30), vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Mode(
                      title: "Auto",
                      isMain: true,
                    ),
                    Mode(
                      title: "Dry",
                      icon: FontAwesomeIcons.wind,
                      // iconSize: 20,
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
    );
  }
}

class Mode extends StatelessWidget {
  const Mode({
    Key key,
    this.title,
    this.icon,
    this.isMain = false,
    this.iconSize = 18,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final bool isMain;
  final double iconSize;
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
        )
      ],
    );
  }
}

class FanSpeedSlider extends StatefulWidget {
  @override
  _FanSpeedSliderState createState() => _FanSpeedSliderState();
}

class _FanSpeedSliderState extends State<FanSpeedSlider> {
  double _value = 0;
  final TextStyle sliderDivsionsTextStyle =
      TextStyle(color: Colors.white38, fontSize: response.setFontSize(12));
  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      // fit: StackFit.expand,
      children: <Widget>[
        Positioned(
          bottom: 34,
          left: -3.5,
          right: -3.5,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '1',
                    style: sliderDivsionsTextStyle,
                  ),
                  Text(
                    '2',
                    style: sliderDivsionsTextStyle,
                  ),
                  Text(
                    '3',
                    style: sliderDivsionsTextStyle,
                  ),
                  Text(
                    '4',
                    style: sliderDivsionsTextStyle,
                  ),
                  Text(
                    '5',
                    style: sliderDivsionsTextStyle,
                  ),
                ],
              ),
            ),
          ),
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 5.5,
            inactiveTrackColor: Color(0xff18191B),
            activeTickMarkColor: Colors.transparent,
            inactiveTickMarkColor: Colors.transparent,
            overlayColor: Colors.transparent,
            trackShape: RoundedRectSliderTrackShape(),
            // thumbColor: Color(0xff18191B),
          ),
          child: Slider(
              min: 0,
              max: 4,
              divisions: 4,
              value: _value,
              onChanged: (value) {
                setState(() {
                  _value = value;
                });
              }),
        ),
      ],
    );
  }
}
