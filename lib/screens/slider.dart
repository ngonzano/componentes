import 'package:fl_componentes/theme/theme.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  _SliderScreenState createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _sliderValue = 100;
  bool _sliderEnable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders y Checks'),
      ),
      body: Column(
        //aqui se envolvio en un nuevo witget y usar el SingleChildScrollView
        children: [
          Slider.adaptive(
              min: 50,
              max: 400,
              //divisions: 10,
              activeColor: AppTheme.primary,
              value: _sliderValue,
              onChanged: _sliderEnable
                  ? (value) {
                      _sliderValue = value;
                      setState(() {});
                    }
                  : null),
          /* Checkbox(
            value: _sliderEnable, 
            onChanged: (value){
              _sliderEnable =value ?? true;
              setState(() {            
              });
              }
            ),

            Switch(
              value: _sliderEnable, 
              onChanged:  (value) => setState((){_sliderEnable = value ;})
            ),
*/
          CheckboxListTile(
              title: const Text('Habilitar Slider'),
              value: _sliderEnable,
              activeColor: AppTheme.primary,
              onChanged: (value) => setState(() {
                    _sliderEnable = value ?? true;
                  })),
          SwitchListTile.adaptive(
              title: const Text('Habilitar Slider'),
              value: _sliderEnable,
              activeColor: AppTheme.primary,
              onChanged: (value) => setState(() {
                    _sliderEnable = value;
                  })),
          const AboutListTile(),
          Expanded(
            child: SingleChildScrollView(
              child: Image(
                image: NetworkImage(
                    'https://firebasestorage.googleapis.com/v0/b/laser-halia.appspot.com/o/23751.jpg?alt=media&token=0f8fcb31-dff7-4529-9d5e-e3647067076f'),
                fit: BoxFit.contain,
                width: _sliderValue,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
