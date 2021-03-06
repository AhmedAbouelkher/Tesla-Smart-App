import 'package:flutter/material.dart';
import 'dart:math' as math;

class CustomRoundedRectSliderTrackShape extends SliderTrackShape
    with BaseSliderTrackShape {
  /// Create a slider track that draws two rectangles with rounded outer edges.
  const CustomRoundedRectSliderTrackShape();

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    @required RenderBox parentBox,
    @required SliderThemeData sliderTheme,
    @required Animation<double> enableAnimation,
    @required TextDirection textDirection,
    @required Offset thumbCenter,
    bool isDiscrete = false,
    bool isEnabled = false,
  }) {
    assert(context != null);
    assert(offset != null);
    assert(parentBox != null);
    assert(sliderTheme != null);
    assert(sliderTheme.disabledActiveTrackColor != null);
    assert(sliderTheme.disabledInactiveTrackColor != null);
    assert(sliderTheme.activeTrackColor != null);
    assert(sliderTheme.inactiveTrackColor != null);
    assert(sliderTheme.thumbShape != null);
    assert(enableAnimation != null);
    assert(textDirection != null);
    assert(thumbCenter != null);
    // If the slider track height is less than or equal to 0, then it makes no
    // difference whether the track is painted or not, therefore the painting
    // can be a no-op.
    if (sliderTheme.trackHeight <= 0) {
      return;
    }

    // Assign the track segment paints, which are leading: active and
    // trailing: inactive.
    final ColorTween activeTrackColorTween = ColorTween(
        begin: sliderTheme.disabledActiveTrackColor,
        end: sliderTheme.activeTrackColor);
    final ColorTween inactiveTrackColorTween = ColorTween(
        begin: sliderTheme.disabledInactiveTrackColor,
        end: sliderTheme.inactiveTrackColor);
    final Paint activePaint = Paint()
      ..shader = LinearGradient(
        colors: [Color(0xff005B9A), Color(0xff0FA0F3)],
      ).createShader(
        Rect.fromCenter(
            center: thumbCenter, height: sliderTheme.trackHeight, width: 300),
      );

    final Paint inactivePaint = Paint()
      ..color = inactiveTrackColorTween.evaluate(enableAnimation);
    Paint leftTrackPaint;
    Paint rightTrackPaint;
    switch (textDirection) {
      case TextDirection.ltr:
        leftTrackPaint = activePaint;
        rightTrackPaint = inactivePaint;
        break;
      case TextDirection.rtl:
        leftTrackPaint = inactivePaint;
        rightTrackPaint = activePaint;
        break;
    }

    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );

    // The arc rects create a semi-circle with radius equal to track height.
    final Rect leftTrackArcRect = Rect.fromLTWH(
        trackRect.left, trackRect.top, trackRect.height, trackRect.height);
    if (!leftTrackArcRect.isEmpty)
      context.canvas.drawArc(
          leftTrackArcRect, math.pi / 2, math.pi, false, leftTrackPaint);
    final Rect rightTrackArcRect = Rect.fromLTWH(
        trackRect.right - trackRect.height / 2,
        trackRect.top,
        trackRect.height,
        trackRect.height);
    if (!rightTrackArcRect.isEmpty)
      context.canvas.drawArc(
          rightTrackArcRect, -math.pi / 2, math.pi, false, rightTrackPaint);

    final Size thumbSize =
        sliderTheme.thumbShape.getPreferredSize(isEnabled, isDiscrete);
    final Rect leftTrackSegment = Rect.fromLTRB(
        trackRect.left + trackRect.height / 2,
        trackRect.top,
        thumbCenter.dx - thumbSize.width / 2,
        trackRect.bottom);
    if (!leftTrackSegment.isEmpty)
      context.canvas.drawRect(leftTrackSegment, leftTrackPaint);
    final Rect rightTrackSegment = Rect.fromLTRB(
        thumbCenter.dx + thumbSize.width / 2,
        trackRect.top,
        trackRect.right,
        trackRect.bottom);
    if (!rightTrackSegment.isEmpty)
      context.canvas.drawRect(rightTrackSegment, rightTrackPaint);
  }
}
