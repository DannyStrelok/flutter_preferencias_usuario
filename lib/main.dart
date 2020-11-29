import 'package:flutter/material.dart';
import 'package:flutter_user_preferences/src/screens/home_screen.dart';
import 'package:flutter_user_preferences/src/screens/settings_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        HomeScreen.routeName: (BuildContext context) => HomeScreen(),
        SettingsScreen.routeName: (BuildContext context) => SettingsScreen(),
      },
    );
  }
}
