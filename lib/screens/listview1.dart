import 'package:flutter/material.dart';

class Listview1 extends StatelessWidget {
   
  final options = const['Megan','Metal Gear','Super Smash','Final']; 
  const Listview1({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Tipo 1'),
      ),
      body: ListView(
        children: [
          ...options.map(
            (e) => ListTile(
            //leading: Icon(Icons.access_time_sharp),//icono al inicio
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            title: Text(e),
          )).toList()          
        ],
      )
    );
  }
}