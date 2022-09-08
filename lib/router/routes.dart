import 'package:fl_componentes/models/menu_options.dart';
import 'package:fl_componentes/models/models.dart';
import 'package:fl_componentes/screens/screens.dart';
import 'package:flutter/material.dart';

import '../screens/animar_area_objeto.dart';
import '../screens/area_animada.dart';
import '../widgets/boton_snake_animado.dart';
import '../widgets/boton_snake_circular_animado.dart';
import '../widgets/shake_transition.dart';
import '../widgets/nike/shoes_store.dart';
import '../widgets/trasladar_objeto.dart';

class Approutes {
  static const initialRoute = 'home';

  static final menuOptions = <MenuOption>[
    //MenuOption(route: 'home', icon: Icons.home, screen: HomeScreen(), name: 'Home'),

    MenuOption(
        route: 'shoesStore',
        icon: Icons.list_alt,
        screen: ShoesStore(),
        name: 'Nike Shoes Store'),
    MenuOption(
        route: 'shakeTransition',
        icon: Icons.list_alt,
        screen: const ShakeTransitionx(),
        name: 'Mover Widget'),
    MenuOption(
        route: 'botonSnakeCircular',
        icon: Icons.list_alt,
        screen: const GraficasCircularesPage(),
        name: 'Boton Snake Circular Animacion'),
    MenuOption(
        route: 'botonSnake',
        icon: Icons.list_alt,
        screen: const BotonSnake(),
        name: 'Boton Snake Animacion'),
    MenuOption(
        route: 'trasObjeto',
        icon: Icons.list_alt,
        screen: AnimacionesScreen(),
        name: 'traslado objetos'),
    MenuOption(
        route: 'areaAnimada',
        icon: Icons.list_alt,
        screen: AreaAnimada(),
        name: 'Area animada'),
    MenuOption(
        route: 'objetoAnimado',
        icon: Icons.list_alt,
        screen: ObjetosAnimado(),
        name: 'Objeto animado'),
    MenuOption(
        route: 'listview1',
        icon: Icons.list_alt,
        screen: Listview1(),
        name: 'Listview 1'),
    MenuOption(
        route: 'listview2',
        icon: Icons.list_outlined,
        screen: Listview2(),
        name: 'Listview 2'),
    MenuOption(
        route: 'alert',
        icon: Icons.sd_card_alert_outlined,
        screen: Alert(),
        name: 'Alerta'),
    MenuOption(
        route: 'card',
        icon: Icons.card_membership,
        screen: CardPage(),
        name: 'Card'),
    MenuOption(
        route: 'avatar',
        icon: Icons.supervised_user_circle_sharp,
        screen: AvatarScreen(),
        name: 'Avatar Page'),
    MenuOption(
        route: 'animated',
        icon: Icons.play_circle,
        screen: AnimatedScreen(),
        name: 'Contenedor de Animaciones'),
    MenuOption(
        route: 'inputs',
        icon: Icons.input_rounded,
        screen: InputsScreen(),
        name: 'forms de Inputs'),
    MenuOption(
        route: 'slider',
        icon: Icons.slow_motion_video_rounded,
        screen: SliderScreen(),
        name: 'Slider'),
    MenuOption(
        route: 'listviewbuilder',
        icon: Icons.list,
        screen: ListviewbuilderScreen(),
        name: 'listView Builder'),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({'home': (BuildContext context) => const HomeScreen()});

    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }
    return appRoutes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    //para mostrar un page por defecto
    return MaterialPageRoute(builder: (context) => const Alert());
  }
}
