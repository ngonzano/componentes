import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Alert extends StatelessWidget {

  void displayDialogIOS(BuildContext context){
    showCupertinoDialog(
      barrierDismissible: false,
      context: context, 
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Titulo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('Este es el contenido de alerta'),
              SizedBox(height: 30),
              FlutterLogo(size: 100,)
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), 
              child: Text('Cancelar', style: TextStyle(color: Colors.red, fontSize: 15)),
              ),
            TextButton(
              onPressed: () => Navigator.pop(context), 
              child: Text('Ok', style: TextStyle( fontSize: 15 )),
              )
          ]
        );
      }
    );
  }
   
  void displayDialogAndroid(BuildContext context){
    showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (context){
        return AlertDialog(
          elevation: 5,
          title: const Text('Titulo'),
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(15)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('Este es el contenido de alerta'),
              SizedBox(height: 30),
              FlutterLogo(size: 100,)
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), 
              child: Text('Cancelar'),
              ),
              TextButton(
              onPressed: () => Navigator.pop(context), 
              child: Text('Ok'),
              )
          ],
        );
      }
    );
  } 
  const Alert({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
         child: ElevatedButton(
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: const Text('Mostrar Alerta',style: TextStyle(fontSize: 20),),
           ),
           //onPressed: () => displayDialogAndroid(context),
           onPressed: () => Platform.isAndroid 
                            ? displayDialogAndroid(context)
                            : displayDialogIOS(context)
           ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.close_rounded),
        onPressed: () => Navigator.pop(context)
        ,),
    );
  }
}