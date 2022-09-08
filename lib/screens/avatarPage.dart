import 'package:fl_componentes/theme/theme.dart';
import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
  const AvatarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatars'),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: CircleAvatar(
              child: const Text('NG'),
              backgroundColor: AppTheme.secundario,
            ),
          )
        ],
      ),
      body: Center(
        child: CircleAvatar(
          maxRadius: 100,
          backgroundImage: NetworkImage(
              'https://firebasestorage.googleapis.com/v0/b/laser-halia.appspot.com/o/23751.jpg?alt=media&token=0f8fcb31-dff7-4529-9d5e-e3647067076f'),
        ),
      ),
    );
  }
}
