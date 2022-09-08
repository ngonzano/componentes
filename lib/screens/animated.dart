import 'dart:math' show Random;

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget { //estos se cambia para las animaciones
   
  const AnimatedScreen({Key? key}) : super(key: key);

  @override
  _AnimatedScreenState createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {

 double _width = 100;
 double _height = 100;
 Color _color = Colors.green;
 BorderRadiusGeometry _borderRadius = BorderRadius.circular(20);

 void changeShape(){
   final random = Random();
   _width = random.nextInt(300).toDouble()+100;
   _height= random.nextInt(300).toDouble()+100;
   _color= Color.fromRGBO(
     random.nextInt(255), 
     random.nextInt(255), 
     random.nextInt(255), 
     1
     );
   _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble()+10);

   setState(() {});
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contenedor de Imagenes'),
      ),
      body: Center(
         child: AnimatedContainer( // un contenedor es para es como un div de html puede tener bordes fijos color de fondo etc      
            duration: const Duration(milliseconds: 1000),// lo que demora en su transformacion
            curve: Curves.bounceOut,//revisar en la guia sus animaciones
            width: _width,
            height: _height,
            decoration: BoxDecoration( //color y cuanta curva tendra
              color: _color,
              borderRadius: _borderRadius
            ),
           ),
          ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_circle_outline, size: 35,),
        onPressed: () {
        changeShape();//para que llame al metodo que actualizara todo
        },
      ),
    );
  }
}