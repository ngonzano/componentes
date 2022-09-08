import 'package:flutter/material.dart';
import 'package:fl_componentes/widgets/widgets.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        children: [
          CustomCardType1(),
          SizedBox(
            height: 10,
          ),
          CustomCardType2(
              imageUrl:
                  'https://i0.wp.com/codigoespagueti.com/wp-content/uploads/2022/04/Dragon-Ball-Donde-estaria-la-casa-de-Goku-en-la-vida-real.jpg?resize=1280%2C720&quality=80&ssl=1',
              name: 'Goku Ultra Instinto 1',
              gif: 'assets/img/loading.gif'),
          SizedBox(
            height: 20,
          ),
          CustomCardType2(
              imageUrl:
                  'https://i0.wp.com/codigoespagueti.com/wp-content/uploads/2022/04/Dragon-Ball-Donde-estaria-la-casa-de-Goku-en-la-vida-real.jpg?resize=1280%2C720&quality=80&ssl=1',
              gif: 'assets/img/loading.gif'),
          SizedBox(
            height: 20,
          ),
          CustomCardType2(
              imageUrl:
                  'https://i0.wp.com/codigoespagueti.com/wp-content/uploads/2022/04/Dragon-Ball-Donde-estaria-la-casa-de-Goku-en-la-vida-real.jpg?resize=1280%2C720&quality=80&ssl=1',
              name: 'Goku Ultra Instinto 3',
              gif: 'assets/img/loading.gif'),
          SizedBox(
            height: 20,
          ),
          CustomCardType2(
              imageUrl:
                  'https://i0.wp.com/codigoespagueti.com/wp-content/uploads/2022/04/Dragon-Ball-Donde-estaria-la-casa-de-Goku-en-la-vida-real.jpg?resize=1280%2C720&quality=80&ssl=1',
              name: 'Goku Ultra Instinto 4',
              gif: 'assets/img/loading.gif'),
          SizedBox(height: 100)
        ],
      ),
    );
  }
}
