import 'package:flutter/material.dart';
import 'package:prueba_1/src/pages/home_page.dart';
import 'package:prueba_1/src/pages/persona_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home'    : (BuildContext context) => HomePage(),
        'persona_page' : (BuildContext context) => PersonaPage()
      },
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
    );
  }
}