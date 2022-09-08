import 'package:fl_componentes/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomCardType1 extends StatelessWidget {
  const CustomCardType1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const ListTile(
              leading:
                  Icon(Icons.photo_album_outlined, color: AppTheme.primary),
              title: Text('Titulo.....'),
              subtitle: Text(
                  'Sunt proident enim aliqua velit duis cupidatat incididunt veniam Lorem ex.')),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text('Ok'),
                ),
                TextButton(onPressed: () {}, child: const Text('Cancel'))
              ],
            ),
          )
        ],
      ),
    );
  }
}
