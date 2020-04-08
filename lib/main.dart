import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tesla_smart_app/Response.dart';
import 'package:tesla_smart_app/screens/lock_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void setState(fn) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Response(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: TextTheme(
            body1: TextStyle(
                // fontFamily: 'Raleway',
                ),
          ),
        ),
        home: LockScreen(),
      ),
    );
  }
}
