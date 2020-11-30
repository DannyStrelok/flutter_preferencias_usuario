import 'package:flutter/material.dart';
import 'package:flutter_user_preferences/src/share_preferences/user_prefs.dart';
import 'package:flutter_user_preferences/src/widgets/menu_widget.dart';

class HomeScreen extends StatelessWidget {

  static final String routeName = 'home';
  final prefs = new UserPrefs();

  @override
  Widget build(BuildContext context) {
    prefs.lastScreen = HomeScreen.routeName;

    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de usuario'),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Color secundario ${prefs.colorSecundario}'),
          Divider(),
          Text('Género ${prefs.genero}'),
          Divider(),
          Text('Nombre usuario ${prefs.nombre}'),
          Divider(),
        ],
      ),
    );
  }
}
