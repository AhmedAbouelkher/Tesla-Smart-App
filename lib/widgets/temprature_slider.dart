import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:tesla_smart_app/screens/car_status.dart';

class TempratureSlider extends StatelessWidget {
  final double buttonRadius = 135;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: buttonRadius * 2, //buttonRadius * 2
      width: buttonRadius * 2, //buttonRadius * 2
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(buttonRadius), //buttonRadius
        gradient: LinearGradient(
          colors: [Color(0xff1C2023), Color(0xff1C2023)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        // boxShadow: [
        //   BoxShadow(
        //     color: Color(0xff5f6569).withOpacity(0.8),
        //     blurRadius: buttonRadius / 3.5, //buttonRadius / 2.5
        //     spreadRadius: -buttonRadius / 6.6, //buttonRadius / 5.6
        //     offset: Offset(
        //       -buttonRadius / 6.5,
        //       -buttonRadius / 6.5,
        //     ), //buttonRadius / 5, buttonRadius / 5
        //   ),
        //   BoxShadow(
        //     color: Colors.black,
        //     blurRadius: buttonRadius / 4.5, //buttonRadius / 2.5
        //     spreadRadius: -buttonRadius / 4.6, //buttonRadius / 5.6
        //     offset: Offset(
        //       buttonRadius / 6.5,
        //       buttonRadius / 6.5,
        //     ), //buttonRadius / 5, buttonRadius / 5
        //   ),
        // ],
      ),
      child: Center(
        child: Container(
          height: buttonRadius * 1.85, //buttonRadius * 1.8
          width: buttonRadius * 1.85, //buttonRadius * 1.8
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff1C2023), Color(0xff1C2023)],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
            borderRadius: BorderRadius.circular(buttonRadius), //buttonRadius
          ),
          child: SleekCircularSlider(
            min: 5,
            max: 33,
            initialValue: 24,
            onChange: (_) {},
            innerWidget: (double value) {
              var coolingValue = value.round();
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "$coolingValue\°C",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: response.setFontSize(40)),
                  ),
                  Text(
                    "Cooling...",
                    style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.w500,
                        fontSize: response.setFontSize(17)),
                  ),
                ],
              );
            },
            appearance: CircularSliderAppearance(
              size: response.setHeight(250),
              startAngle: 90,
              angleRange: 360,
              customWidths: CustomSliderWidths(
                trackWidth: response.setHeight(40),
                progressBarWidth: response.setHeight(40),
                handlerSize: response.setHeight(18),
              ),
              customColors: CustomSliderColors(
                trackColor: Color(0xff18191B),
                progressBarColors: [Color(0xff0FA0F3), Color(0xff005B9A)],
                hideShadow: true,
                dotColor: Color(0xff18191B),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
