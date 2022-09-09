import 'package:flutter/material.dart';

class BotonAnimado extends StatefulWidget {
  const BotonAnimado({Key? key}) : super(key: key);

  @override
  State<BotonAnimado> createState() => _BotonAnimadoState();
}

class _BotonAnimadoState extends State<BotonAnimado> {
  bool enable = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: InkWell(
          onTap: () {
            setState(() {
              enable = !enable;
            });
          },
          child: SizedBox(
            width: 100,
            height: 100,
            child: AnimatedContainer(
              curve: Curves.decelerate,
              duration: const Duration(seconds: 1),
              color: enable ? Colors.green : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
