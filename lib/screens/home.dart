import 'package:fl_componentes/router/routes.dart';
import 'package:fl_componentes/theme/theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuOptions = Approutes.menuOptions;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Componentes en flutter'),
        ),
        body: ListView.separated(
            itemBuilder: (context, index) => ListTile(
                  leading:
                      Icon(menuOptions[index].icon, color: AppTheme.primary),
                  title: Text(menuOptions[index].name),
                  onTap: () {
                    Navigator.pushNamed(context, menuOptions[index].route);
                  },
                ),
            separatorBuilder: (_, __) => const Divider(),
            itemCount: menuOptions.length));
  }
}
