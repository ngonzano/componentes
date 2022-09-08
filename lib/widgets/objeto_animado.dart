import 'package:flutter/material.dart';
import 'dart:math' as Math;

//animar area de un objeto

class ObjetoAnimado extends StatefulWidget {
  final int tiempoSegundos;
  final Widget child;
  final double rotacionBegin;
  final double rotacionEnd;
  final double opacidadBegin;
  final double opacidadEnd;
  final double opacidadOutBegin;
  final double opacidadOutEnd;
  final double moverBegin;
  final double moverEnd;
  final double agrandarBegin;
  final double agrandarEnd;
  final Curve curve;

  final double opacidadIntervalBegin;
  final double opacidadIntervalEnd;
  final double opacidadOutIntervalBegin;
  final double opacidadOutIntervalEnd;

  const ObjetoAnimado({
    Key? key,
    required this.child,
    this.tiempoSegundos = 4,
    this.rotacionBegin = 0.0,
    this.rotacionEnd = 1.0,
    this.opacidadBegin = 0.0,
    this.opacidadEnd = 1.0,
    this.opacidadOutBegin = 0.0,
    this.opacidadOutEnd = 1.0,
    this.moverBegin = 0.0,
    this.moverEnd = 200.0,
    this.agrandarBegin = 0.5,
    this.agrandarEnd = 2.0,
    this.curve = Curves.easeInCubic,
    this.opacidadIntervalBegin = 0.0,
    this.opacidadIntervalEnd = 0.25,
    this.opacidadOutIntervalBegin = 0.75,
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
  late Animation<double> deslizarX;
  late Animation<double> deslizarY;
  late Animation<double> agrandar;
  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: Duration(seconds: widget.tiempoSegundos));
    // rotacion = Tween(begin: 0.0, end: 2 * Math.pi).animate(controller!);
    rotacion =
        Tween(begin: widget.rotacionBegin, end: widget.rotacionEnd * Math.pi)
            .animate(CurvedAnimation(parent: controller, curve: widget.curve));

    opacidad = Tween(begin: widget.opacidadBegin, end: widget.opacidadEnd)
        .animate(CurvedAnimation(
            parent: controller,
            curve: Interval(
                widget.opacidadIntervalBegin, widget.opacidadIntervalEnd,
                curve: widget.curve)));

    opacidadOut = Tween(
            begin: widget.opacidadOutBegin, end: widget.opacidadOutEnd)
        .animate(CurvedAnimation(
            parent: controller,
            curve: Interval(
                widget.opacidadOutIntervalBegin, widget.opacidadOutIntervalEnd,
                curve: widget.curve)));

    deslizarX = Tween(begin: widget.moverBegin, end: widget.moverEnd)
        .animate(CurvedAnimation(parent: controller, curve: widget.curve));

    deslizarY = Tween(begin: widget.moverBegin, end: widget.moverEnd)
        .animate(CurvedAnimation(parent: controller, curve: widget.curve));

    agrandar = Tween(begin: widget.agrandarBegin, end: widget.agrandarEnd)
        .animate(CurvedAnimation(parent: controller, curve: widget.curve));

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        controller.reverse();
        // controller.reset();
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
    // controller.repeat();
    controller.forward();
    // controller.reverse();
    // controller.reset();
    return AnimatedBuilder(
        animation: controller,
        child: widget.child,
        builder: (BuildContext context, Widget? childRectangulo) {
          return Transform.translate(
            offset: Offset(deslizarX.value, deslizarY.value),
            child: Transform.rotate(
                angle: rotacion.value,
                child: Opacity(
                    opacity: opacidad.value - opacidadOut.value,
                    child: Transform.scale(
                        scale: agrandar.value, child: childRectangulo))),
          );
        });
  }
}
