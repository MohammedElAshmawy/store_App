import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/Screens/homeScreen.dart';
import 'package:store_app/Screens/updateScreen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        updateScreen.id:(context)=>updateScreen()
      },
      debugShowCheckedModeBanner: false,
      home: homeScreen()
    );
  }
}

