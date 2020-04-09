import 'package:flutter/material.dart';
import 'bottom_sheet.dart';
import 'package:tesla_smart_app/widgets/custom_slider_thumb.dart';
import 'package:tesla_smart_app/widgets/custom_slider_track.dart';

class FanSpeedSlider extends StatefulWidget {
  @override
  _FanSpeedSliderState createState() => _FanSpeedSliderState();
}

class _FanSpeedSliderState extends State<FanSpeedSlider> {
  double _value = 3;
  final TextStyle sliderDivsionsTextStyle =
      TextStyle(color: Colors.white38, fontSize: response.setFontSize(12));
  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Positioned(
          bottom: response.setHeight(34),
          left: response.setWidth(-3.5),
          right: response.setWidth(-3.5),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: response.setWidth(25)),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('1', style: sliderDivsionsTextStyle),
                  Text('2', style: sliderDivsionsTextStyle),
                  Text('3', style: sliderDivsionsTextStyle),
                  Text('4', style: sliderDivsionsTextStyle),
                  Text('5', style: sliderDivsionsTextStyle),
                ],
              ),
            ),
          ),
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: response.setHeight(5.5),
            inactiveTrackColor: Color(0xff18191B),
            activeTickMarkColor: Colors.transparent,
            inactiveTickMarkColor: Colors.transparent,
            overlayColor: Colors.transparent,
            trackShape: CustomRoundedRectSliderTrackShape(),
            thumbColor: Color(0xff18191B),
            thumbShape: CustomThumbShape(
              thumbRadius: 11,
            ),
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
