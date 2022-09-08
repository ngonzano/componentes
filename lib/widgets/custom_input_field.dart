import 'package:fl_componentes/theme/theme.dart';
import 'package:flutter/material.dart';

class CustonInputField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? icon;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;

  final String formProperty;
  final Map<String, dynamic> formValues;

  const CustonInputField({
    Key? key,
    this.hintText,
    this.labelText,
    this.helperText,
    this.icon,
    this.suffixIcon,
    this.keyboardType,
    this.obscureText = false,
    required this.formProperty,
    required this.formValues,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obscureText,
      autofocus: false,
      initialValue: '',
      textCapitalization: TextCapitalization.words,
      onChanged: (value) => formValues[formProperty] = value,
      validator: (value) {
        if (value == null) return 'Este campo es requerido';
        return value.length < 3 ? 'Minimo de 3 caracteres' : null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        //counterText: 'puede mostrar numero de caracteres',
        //prefixIcon: Icon(Icons.verified_user,color: AppTheme.primary),//aparece un icono al inicio
        suffixIcon: suffixIcon == null
            ? null
            : Icon(suffixIcon,
                color: AppTheme.primary), //aparece un icono al final
        icon: icon == null
            ? null
            : Icon(icon,
                size: 30, color: AppTheme.primary), //aparece antes del textform
      ),
    );
  }
}
