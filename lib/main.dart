import 'package:flutter/material.dart';
import 'package:response/Response.dart';
import 'package:tesla_smart_app/screens/lock_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Response(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LockScreen(),
      ),
    );
  }
}
