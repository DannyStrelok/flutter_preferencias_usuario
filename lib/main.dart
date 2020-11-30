import 'package:flutter/material.dart';
import 'package:flutter_user_preferences/src/screens/home_screen.dart';
import 'package:flutter_user_preferences/src/screens/settings_screen.dart';
import 'package:flutter_user_preferences/src/share_preferences/user_prefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new UserPrefs();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final prefs = new UserPrefs();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: prefs.lastScreen,
      routes: {
        HomeScreen.routeName: (BuildContext context) => HomeScreen(),
        SettingsScreen.routeName: (BuildContext context) => SettingsScreen(),
      },
    );
  }
}
