import 'package:flutter/material.dart';

import '../widgets/container_animado.dart';

class AreaAnimada extends StatelessWidget {
  const AreaAnimada({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Area animada'),
        centerTitle: true,
      ),
      body: Center(
        child: ShinyButton(
          colorSecundario: Colors.white,
          colorPrimario: Colors.amber.withOpacity(0.1),
          duracion_: 4000,
          child: Container(
            width: 100,
            height: 100,
          ),
        ),
      ),
    );
  }
}
