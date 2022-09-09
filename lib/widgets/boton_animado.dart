import 'package:flutter/material.dart';

class ButtonEnable extends StatefulWidget {
  const ButtonEnable({Key? key}) : super(key: key);

  @override
  State<ButtonEnable> createState() => _ButtonEnableState();
}

class _ButtonEnableState extends State<ButtonEnable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            BotonAnimado(
              enableButton: true,
            ),
            BotonAnimado(enableButton: true),
            BotonAnimado(enableButton: true),
            BotonAnimado(enableButton: true),
          ],
        ));
  }
}

class BotonAnimado extends StatefulWidget {
  BotonAnimado({Key? key, required this.enableButton}) : super(key: key);
  bool enableButton;

  @override
  State<BotonAnimado> createState() => _BotonAnimadoState();
}

class _BotonAnimadoState extends State<BotonAnimado> {
  // bool enable = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: InkWell(
        onTap: () {
          setState(() {
            widget.enableButton = !widget.enableButton;
          });
        },
        child: SizedBox(
          width: 100,
          height: 100,
          child: AnimatedContainer(
            curve: Curves.decelerate,
            duration: const Duration(seconds: 1),
            color: widget.enableButton ? Colors.green : Colors.black,
          ),
        ),
      ),
    );
  }
}
