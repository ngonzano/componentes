import 'package:flutter/material.dart';

//Area animada

class ShinyButton extends StatefulWidget {
  final Widget child;
  final Color colorPrimario;
  final Color colorSecundario;
  final VoidCallback? onTap;
  final int duracion_; //milisegundos

  const ShinyButton(
      {Key? key,
      required this.child,
      required this.colorPrimario,
      this.onTap,
      required this.duracion_,
      required this.colorSecundario})
      : super(key: key);

  @override
  State<ShinyButton> createState() => _ShinyButtonState();
}

class _ShinyButtonState extends State<ShinyButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: widget.duracion_));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward(from: 0.0);
      }
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: AnimatedBuilder(
          animation: _controller,
          builder: (_, __) {
            return Container(
              child: widget.child,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                    widget.colorPrimario,
                    widget.colorSecundario,
                    widget.colorPrimario
                  ],
                      stops: [
                    0.0,
                    _controller.value,
                    1.0
                  ])),
            );
          }),
    );
  }
}
