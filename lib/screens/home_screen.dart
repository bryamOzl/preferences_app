import 'package:flutter/material.dart';
import 'package:preferences_app/share_preferences/preferences.dart';
import 'package:preferences_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static String routerName = 'home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        drawer: SideMenu(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('isDark Mode: ${Preferences.isDarkMode}'),
            Divider(),
            Text(Preferences.gender == 1
                ? 'Genero: Maculino'
                : 'Genero: Femenino'),
            Divider(),
            Text('Nombre de usuario: ${Preferences.name}'),
            Divider(),
          ],
        ));
  }
}
