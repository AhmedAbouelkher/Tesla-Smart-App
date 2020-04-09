import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:response/Response.dart';
import 'package:tesla_smart_app/screens/car_status.dart';
import 'package:tesla_smart_app/widgets/button.dart';

var response = ResponseUI();

class LockScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff353A40),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(response.setHeight(20)),
                    child: RoundedButton(
                      buttonRadius: response.setHeight(21),
                      icon: FontAwesomeIcons.cog,
                      iconSize: response.setHeight(15),
                    ),
                  ),
                ],
              ),
              SizedBox(height: response.setHeight(15)),
              Text(
                "Tesla",
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: response.setFontSize(20),
                    fontWeight: FontWeight.normal),
              ),
              Text(
                "Cybertruck",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: response.setFontSize(35),
                    fontWeight: FontWeight.w900),
              ),
              Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "297",
                        style: TextStyle(
                          fontSize: response.setFontSize(150),
                          color: Colors.white,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      Text(
                        " km",
                        style: TextStyle(
                            fontSize: response.setFontSize(20),
                            color: Colors.white,
                            height: response.setHeight(3)),
                      ),
                    ],
                  ),
                  Positioned(
                    right: response.setWidth(-240),
                    top: response.setHeight(40),
                    child: Image.asset(
                      'assets/images/home_page.png',
                      fit: BoxFit.cover,
                      scale: response.screenHeight / 680,
                    ),
                  ),
                ],
              ),
              SizedBox(height: response.setHeight(200)),
              Text(
                'A/C is turned on',
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: response.setFontSize(17),
                ),
              ),
              SizedBox(height: response.setHeight(25)),
              RoundedButton(
                buttonRadius: response.setHeight(45),
                icon: Icons.lock_open,
                iconSize: response.setHeight(20),
                activeColors: [Color(0xff0FA0F3), Color(0xff0063A8)],
                isMain: true,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return CarStatusDetails();
                      },
                    ),
                  );
                },
              ),
              Text(
                "\nTap to open the car",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  fontSize: response.setFontSize(14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
