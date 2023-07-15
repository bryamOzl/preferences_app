import 'package:flutter/material.dart';
import 'package:preferences_app/screens/providers/theme_provider.dart';
import 'package:preferences_app/share_preferences/preferences.dart';
import 'package:preferences_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  static String routerName = 'settings';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // bool isDarkMode = false;
  // int gender = 1;
  // String name = 'Bryam';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: SideMenu(),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ajustes',
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Divider(),
              SwitchListTile.adaptive(
                value: Preferences.isDarkMode,
                title: const Text('Darkmode'),
                onChanged: (value) {
                  Preferences.isDarkMode = value;
                  final themeProvider =
                      Provider.of<ThemeProvider>(context, listen: false);
                  value
                      ? themeProvider.setDarkMode()
                      : themeProvider.setLightMode();
                  setState(() {});
                },
              ),
              Divider(),
              RadioListTile<int>(
                value: 1,
                groupValue: Preferences.gender,
                title: Text('Masculino'),
                onChanged: (value) {
                  Preferences.gender = value ?? 1;
                  setState(() {});
                },
              ),
              RadioListTile<int>(
                value: 2,
                groupValue: Preferences.gender,
                title: Text('Femenino'),
                onChanged: (value) {
                  Preferences.gender = value ?? 2;
                  setState(() {});
                },
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  initialValue: Preferences.name,
                  onChanged: (value) {
                    Preferences.name = value;
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    labelText: 'Nombre',
                    helperText: 'Nombre de usuario',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
