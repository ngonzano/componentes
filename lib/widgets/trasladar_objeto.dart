import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimacionesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            right: 100,
            top: 150,
            child: ObjetoAnimado(
              tiempoSegundos: 5,
              child: _Rectangulo(),
            ),
          )
        ],
      ),
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: const BoxDecoration(color: Colors.blue),
    );
  }
}

class ObjetoAnimado extends StatefulWidget {
  final int tiempoSegundos;
  final Widget child;

  final double rotacionBegin;
  final double rotacionEnd;

  final double opacidadBegin;
  final double opacidadEnd;

  final double opacidadOutBegin;
  final double opacidadOutEnd;

  final double opacidadIntervalBegin;
  final double opacidadIntervalEnd;

  final double opacidadOutIntervalBegin;
  final double opacidadOutIntervalEnd;

  const ObjetoAnimado({
    Key? key,
    required this.child,
    this.tiempoSegundos = 1,
    this.rotacionBegin = 0.0,
    this.rotacionEnd = 1.0,
    this.opacidadBegin = 0.0,
    this.opacidadEnd = 1.0,
    this.opacidadOutBegin = 0.0,
    this.opacidadOutEnd = 1.0,
    this.opacidadIntervalBegin = 0.0,
    this.opacidadIntervalEnd = 0.25,
    this.opacidadOutIntervalBegin = 0.9,
    this.opacidadOutIntervalEnd = 1.0,
  }) : super(key: key);

  @override
  State<ObjetoAnimado> createState() => _ObjetoAnimadoState();
}

class _ObjetoAnimadoState extends State<ObjetoAnimado>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotacion;
  late Animation<double> opacidad;
  late Animation<double> opacidadOut;
  late Animation<double> deslizarDerecha;
  late Animation<double> deslizarArriba;
  late Animation<double> deslizarIzquierda;
  late Animation<double> deslizarAbajo;
  late Animation<double> agrandar;
  late Animation<double> disminuir;
  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: Duration(seconds: widget.tiempoSegundos));

    rotacion = Tween(
            begin: widget.rotacionBegin, end: widget.rotacionEnd * Math.pi)
        .animate(CurvedAnimation(parent: controller, curve: Curves.decelerate));

    opacidad = Tween(begin: widget.opacidadBegin, end: widget.opacidadEnd)
        .animate(CurvedAnimation(
            parent: controller,
            curve: Interval(
                widget.opacidadIntervalBegin, widget.opacidadIntervalEnd,
                curve: Curves.decelerate)));

    opacidadOut = Tween(
            begin: widget.opacidadOutBegin, end: widget.opacidadOutEnd)
        .animate(CurvedAnimation(
            parent: controller,
            curve: Interval(
                widget.opacidadOutIntervalBegin, widget.opacidadOutIntervalEnd,
                curve: Curves.decelerate)));

    deslizarDerecha = Tween(begin: -200.0, end: 0.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.25, curve: Curves.bounceInOut)));

    deslizarAbajo = Tween(begin: 0.0, end: 300.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.25, 0.75, curve: Curves.decelerate)));

    deslizarIzquierda = Tween(begin: 0.0, end: -200.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.75, 1.0, curve: Curves.bounceInOut)));

    deslizarArriba = Tween(begin: 0.0, end: -300.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(1.0, 1.0, curve: Curves.bounceInOut)));

    agrandar = Tween(begin: 0.25, end: 0.5).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.25, 0.35, curve: Curves.decelerate)));

    disminuir = Tween(begin: 0.5, end: 0.25).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.65, 0.75, curve: Curves.decelerate)));

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        // controller.reverse();
        controller.reset();
      }
      if (controller.status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return AnimatedBuilder(
        animation: controller,
        child: widget.child,
        builder: (BuildContext context, Widget? childRectangulo) {
          return Transform.translate(
            offset: Offset(deslizarDerecha.value + deslizarIzquierda.value,
                deslizarArriba.value + deslizarAbajo.value),
            child: Transform.rotate(
                angle: rotacion.value,
                child: Opacity(
                    opacity: opacidad.value - opacidadOut.value,
                    child: Transform.scale(
                        scale: agrandar.value + disminuir.value,
                        child: childRectangulo))),
          );
        });
  }
}
