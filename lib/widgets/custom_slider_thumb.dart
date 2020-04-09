import 'package:flutter/material.dart';

class CustomThumbShape extends SliderComponentShape {
  CustomThumbShape({this.thumbRadius});
  final double thumbRadius;
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {Animation<double> activationAnimation,
      Animation<double> enableAnimation,
      bool isDiscrete,
      TextPainter labelPainter,
      RenderBox parentBox,
      SliderThemeData sliderTheme,
      TextDirection textDirection,
      double value}) {
    final canvas = context.canvas;
    final mainSliderThumbPaint = Paint()
      ..style = PaintingStyle.fill
      ..shader = LinearGradient(
        colors: [sliderTheme.thumbColor, Colors.black26],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromCircle(center: center, radius: thumbRadius));
    canvas.drawCircle(center, thumbRadius, mainSliderThumbPaint);
    final sliderCenterCirclePaint = Paint()
      ..color = sliderTheme.activeTrackColor;
    canvas.drawCircle(center, thumbRadius * 0.15, sliderCenterCirclePaint);
  }
}
