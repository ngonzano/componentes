import 'package:flutter/material.dart';

class ShakeTransitionx extends StatelessWidget {
  const ShakeTransitionx({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Mover Widgets'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            ShakeTransition(
              child: Text(
                'Nilton Gonzano',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ShakeTransition(
              offset: 300,
              duration: const Duration(seconds: 1),
              axis: Axis.vertical,
              child: GestureDetector(
                  onTap: () {
                    print('object');
                  },
                  child: const CircleAvatar()),
            ),
            ShakeTransition(
                offset: 300,
                duration: const Duration(seconds: 10),
                axis: Axis.horizontal,
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Container(
                        height: 100,
                        width: 100,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      label: const Text('Plus One'),
                      icon: const Icon(Icons.plus_one),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class ShakeTransition extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final double offset;
  final Axis axis;

  const ShakeTransition({
    Key? key,
    required this.child,
    this.duration = const Duration(microseconds: 1000),
    this.offset = 140.0,
    this.axis = Axis.horizontal,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      curve: Curves.elasticOut,
      builder: (BuildContext context, Object value, Widget? child) {
        value as double;
        return Transform.translate(
          offset: axis == Axis.horizontal
              ? Offset(value * offset, 0.0)
              : Offset(
                  0.0,
                  value * offset,
                ),
          child: child,
        );
      },
      duration: duration,
      tween: Tween(
        begin: 1.0,
        end: 0.0,
      ),
      child: child,
    );
  }
}
