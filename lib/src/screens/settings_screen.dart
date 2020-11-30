import 'package:flutter/material.dart';
import 'package:flutter_user_preferences/src/share_preferences/user_prefs.dart';
import 'package:flutter_user_preferences/src/widgets/menu_widget.dart';

class SettingsScreen extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  final prefs = new UserPrefs();

  bool _colorSecundario;
  int _genero;
  String _nombre;
  TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    prefs.lastScreen = SettingsScreen.routeName;

    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _nombre = prefs.nombre;
    _textController = new TextEditingController(text: _nombre);
  }

  _setSelectedRadio(int value) async {
    prefs.genero = value;
    setState(() {
      _genero = value;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ajustes'),
          backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
        ),
        drawer: MenuWidget(),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Ajustes',
                style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            SwitchListTile(
                value: _colorSecundario,
                title: Text('Color secundario'),
                onChanged: (bool value) {
                  setState(() {
                    _colorSecundario = value;
                    prefs.colorSecundario = value;
                  });
                }),
            RadioListTile(
              value: 1,
              title: Text('Masculino'),
              groupValue: _genero,
              onChanged: _setSelectedRadio,
            ),
            RadioListTile(
              value: 2,
              title: Text('Femenino'),
              groupValue: _genero,
              onChanged: _setSelectedRadio,
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  helperText: 'Nombre de la persona usando la app'
                ),
                onChanged: (String value) {
                  setState(() {
                    _nombre = value;
                    prefs.nombre = value;
                  });
                },
              ),
            )
          ],
        ));
  }

}
