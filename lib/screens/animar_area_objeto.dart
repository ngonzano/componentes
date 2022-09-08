import 'package:fl_componentes/screens/screens.dart';
import 'package:flutter/material.dart';

class ObjetosAnimado extends StatelessWidget {
  const ObjetosAnimado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Objeto animado'),
        centerTitle: true,
      ),
      body: ObjetoAnimado(
        curve: Curves.bounceInOut,
        child: Container(
          width: 100,
          height: 100,
          color: Colors.green,
        ),
      ),
    );
  }
}
