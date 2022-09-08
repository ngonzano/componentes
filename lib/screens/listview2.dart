import 'package:flutter/material.dart';

class Listview2 extends StatelessWidget {
   
  final options = const['Megan','Metal Gear','Super Smash','Final Fantasy','Vigilante 8']; 

  const Listview2({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Tipo 2'),
      ),
      body: ListView.separated( //el builder no cuenta con el separatorBuilder: (_, __) => const Divider(), 
        itemCount: options.length,
        itemBuilder: (context, index) => ListTile(
            //leading: Icon(Icons.access_time_sharp),//icono al inicio
            title: Text(options[index]),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            onTap: (){
              final game = options[index];
              print(game);
            },
          ), 
        separatorBuilder: (_, __) => const Divider(), 
        )
    );
  }
}