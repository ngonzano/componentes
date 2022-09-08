import 'dart:ui';

import 'package:fl_componentes/widgets/nike/model_shoes_store.dart';
import 'package:flutter/material.dart';

const double _buttonSizeWidth = 160.0;
const double _buttonSizeHeight = 60.0;
const double _buttonCircularSize = 60;
const double _imageSize = 120;
const double _finalImageSize = 30;

class ShoppingCart extends StatefulWidget {
  final Shoes shoes;
  const ShoppingCart({Key? key, required this.shoes}) : super(key: key);

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animationResize;
  Animation<double>? _animationMovementIn;
  Animation<double>? _animationMovementOut;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );

    _animationResize = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: const Interval(0.0, 0.2),
      ),
    );

    _animationMovementIn = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: const Interval(0.3, 0.6, curve: Curves.fastLinearToSlowEaseIn),
      ),
    );
    _animationMovementOut = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: const Interval(0.8, 1.0, curve: Curves.elasticIn),
      ),
    );
    _controller!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pop(true);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      color: Colors.transparent,
      child: AnimatedBuilder(
        animation: _controller!,
        builder: (BuildContext context, Widget? child) {
          final double butonSizeWidth_ =
              (_buttonSizeWidth * _animationResize!.value).clamp(
            _buttonCircularSize,
            _buttonSizeWidth,
          );
          final double buttonSizeHeigth_ =
              (_buttonSizeHeight * _animationResize!.value).clamp(
            _buttonCircularSize,
            _buttonSizeHeight,
          );

          final double panelSizeWidth = (size.width * _animationResize!.value)
              .clamp(_buttonCircularSize, size.width);

          final double panelSizeHeight = (size.height * _animationResize!.value)
              .clamp(_buttonCircularSize, size.height);

          return Stack(fit: StackFit.expand, children: [
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: Container(
                    color: Colors.black87.withOpacity(0.7),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Stack(
                children: [
                  if (_animationMovementIn!.value != 1) ...[
                    Positioned(
                      top: size.height * 0.4 +
                          (_animationMovementIn!.value * size.height * 0.4758),
                      left: size.width * 0.5 - panelSizeWidth * 0.5,
                      width: panelSizeWidth,
                      height: panelSizeHeight,
                      child: AnimacionPanel(
                        size: size,
                        shoes: widget.shoes,
                        animationResize: _animationResize!,
                      ),
                    ),
                  ],
                  //boton del panel
                  ButtonShopping(
                      animationMovementOut: _animationMovementOut,
                      size: size,
                      butonSizeWidth_: butonSizeWidth_,
                      controller: _controller,
                      buttonSizeHeigth_: buttonSizeHeigth_,
                      animationResize: _animationResize),
                ],
              ),
            )
          ]);
        },
      ),
    );
  }
}

class ButtonShopping extends StatelessWidget {
  const ButtonShopping({
    Key? key,
    required Animation<double>? animationMovementOut,
    required this.size,
    required this.butonSizeWidth_,
    required AnimationController? controller,
    required this.buttonSizeHeigth_,
    required Animation<double>? animationResize,
  })  : _animationMovementOut = animationMovementOut,
        _controller = controller,
        _animationResize = animationResize,
        super(key: key);

  final Animation<double>? _animationMovementOut;
  final Size size;
  final double butonSizeWidth_;
  final AnimationController? _controller;
  final double buttonSizeHeigth_;
  final Animation<double>? _animationResize;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 40 - (_animationMovementOut!.value * 100),
      left: size.width * 0.5 - butonSizeWidth_ * 0.5,
      child: TweenAnimationBuilder(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCubicEmphasized,
        builder: (BuildContext context, Object? value, Widget? child) {
          value as double;
          return Transform.translate(
            offset: Offset(
              0.0,
              value * size.height * 0.6,
            ),
            child: child,
          );
        },
        tween: Tween(begin: 1.0, end: 0.0),
        child: InkWell(
          onTap: () {
            _controller!.forward(); //inicia la animacion
          },
          child: Container(
            width: butonSizeWidth_,
            height: buttonSizeHeigth_,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.black,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  const Expanded(
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                    ),
                  ),
                  //para que solo sea visible cuando la animacion no ha empezado
                  if (_animationResize!.value == 1) ...[
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Agregar al carrito',
                      style: TextStyle(color: Colors.white),
                    ),
                  ]
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AnimacionPanel extends StatelessWidget {
  const AnimacionPanel({
    Key? key,
    required this.size,
    required this.shoes,
    required this.animationResize,
  }) : super(key: key);

  final Size size;
  final Shoes shoes;
  final Animation<double> animationResize;

  @override
  Widget build(BuildContext context) {
    final currentImageSize =
        (_imageSize * animationResize.value).clamp(_finalImageSize, _imageSize);
    return TweenAnimationBuilder(
      curve: Curves.easeInOutCubicEmphasized,
      builder: (BuildContext context, Object? value, Widget? child) {
        value as double;
        return Transform.translate(
          offset: Offset(
            0.0,
            value * size.height * 0.6,
          ),
          child: child,
        );
      },
      duration: const Duration(milliseconds: 1000),
      tween: Tween(begin: 1.0, end: 0.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(30),
            topRight: const Radius.circular(30),
            bottomLeft: animationResize.value == 1
                ? const Radius.circular(0)
                : const Radius.circular(30),
            bottomRight: animationResize.value == 1
                ? const Radius.circular(0)
                : const Radius.circular(30),
          ),
          color: Colors.white,
        ),
        // height: (size.height * 0.6 * animationResize.value)
        //     .clamp(_buttonCircularSize, size.height * 0.6),
        // width: (size.width * animationResize.value)
        //     .clamp(_buttonCircularSize, size.width),
        child: Column(
          mainAxisAlignment: animationResize.value == 1
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  shoes.images!.first,
                  height: currentImageSize + 20,
                ),
                if (animationResize.value == 1) ...[
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Text(
                        shoes.model!,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'S\. ${shoes.currentPrice}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  )
                ]
              ],
            ),
            if (animationResize.value == 1) ...[
              const SizedBox(
                height: 20,
              ),
              const Divider(
                color: Colors.grey,
                height: 20,
                indent: 30,
                endIndent: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.fingerprint),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Seleccionar una talla.'.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ]
          ],
        ),
      ),
    );
  }
}
