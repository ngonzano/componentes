import 'package:fl_componentes/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:fl_componentes/router/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: Approutes.initialRoute,
      routes: Approutes.getAppRoutes(),
      onGenerateRoute: Approutes.onGenerateRoute,
      theme: AppTheme.lightTheme,
      //theme:  AppTheme.darkTheme,
    );
  }
}
