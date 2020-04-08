import 'package:flutter/material.dart';

const List<Color> primaryColor = [Color(0xff191b1c), Color(0xff464a4d)];

// typedef VoidCallback = void Function();
// final VoidCallback onTap;

class RoundedButton extends StatelessWidget {
  RoundedButton({
    @required this.buttonRadius,
    this.iconSize,
    this.iconColor,
    this.onTap,
    this.icon,
    this.activeColors = primaryColor,
    this.isMain = false,
    this.blackOpacity = 1,
  });
  final double buttonRadius;
  final double iconSize;
  final IconData icon;
  final Color iconColor;
  final List<Color> activeColors;
  final VoidCallback onTap;
  final bool isMain;
  final double blackOpacity;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      borderRadius: BorderRadius.circular(buttonRadius), //buttonRadius
      onTap: onTap,
      child: Container(
        height: buttonRadius * 2, //buttonRadius * 2
        width: buttonRadius * 2, //buttonRadius * 2
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(buttonRadius), //buttonRadius
          gradient: LinearGradient(
            colors: activeColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xff5f6569),
              blurRadius: buttonRadius / 2.5, //buttonRadius / 2.5
              spreadRadius: -buttonRadius / 5.6, //buttonRadius / 5.6
              offset: Offset(
                -buttonRadius / 5,
                -buttonRadius / 5,
              ), //buttonRadius / 5, buttonRadius / 5
            ),
            BoxShadow(
              color: Colors.black.withOpacity(isMain ? blackOpacity : 0.6),
              blurRadius:
                  buttonRadius / (isMain ? 2 : 2.5), //buttonRadius / 2.5
              spreadRadius:
                  -buttonRadius / (isMain ? 6 : 5.6), //buttonRadius / 5.6
              offset: Offset(
                buttonRadius / (isMain ? 3 : 6),
                buttonRadius / (isMain ? 3 : 5),
              ), //buttonRadius / 5, buttonRadius / 5
            ),
          ],
        ),
        child: Center(
          child: Container(
            height: buttonRadius * 1.85, //buttonRadius * 1.8
            width: buttonRadius * 1.85, //buttonRadius * 1.8
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: activeColors,
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
              borderRadius: BorderRadius.circular(buttonRadius), //buttonRadius
            ),
            child: Container(
              child: Center(
                child: Icon(
                  icon,
                  size: iconSize ?? buttonRadius,
                  color: iconColor ?? Colors.white70,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
