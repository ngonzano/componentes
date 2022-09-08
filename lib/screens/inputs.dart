import 'package:flutter/material.dart';
import 'package:fl_componentes/widgets/widgets.dart';

class InputsScreen extends StatelessWidget {
  const InputsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> miFormKey = GlobalKey<FormState>();

    final Map<String, String> formsValues = {
      'first_name': 'Nilton',
      'last_name': 'Gonzano',
      'email': 'niltongr@outlook.com',
      'password': '1234',
      'role': 'admin'
    };

    return Scaffold(
        appBar: AppBar(
          title: Text('forms de inputs'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Form(
              key: miFormKey,
              child: Column(
                children: [
                  CustonInputField(
                      hintText: 'Nombre del usuario',
                      labelText: 'Nombre',
                      helperText: 'Debe escribir mas de 3 caracteres',
                      icon: Icons.supervised_user_circle_rounded,
                      suffixIcon: Icons.admin_panel_settings,
                      formProperty: 'first_name',
                      formValues: formsValues),
                  SizedBox(
                    height: 20,
                  ),
                  CustonInputField(
                    hintText: 'Apellidos',
                    labelText: 'Apellidoss',
                    helperText: 'ingresar sus apellidos',
                    icon: Icons.supervised_user_circle_rounded,
                    suffixIcon: Icons.admin_panel_settings,
                    formProperty: 'last_name',
                    formValues: formsValues,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustonInputField(
                      keyboardType: TextInputType.emailAddress,
                      hintText: 'Email de usuario',
                      labelText: 'Email',
                      helperText: 'Ingresar un Email',
                      icon: Icons.alternate_email,
                      suffixIcon: Icons.admin_panel_settings,
                      formProperty: 'email',
                      formValues: formsValues),
                  SizedBox(
                    height: 20,
                  ),
                  CustonInputField(
                      obscureText: true,
                      hintText: 'Password de usuario',
                      labelText: 'Password',
                      helperText: 'Ingresar un Password',
                      icon: Icons.password,
                      suffixIcon: Icons.admin_panel_settings,
                      formProperty: 'password',
                      formValues: formsValues),
                  SizedBox(
                    height: 20,
                  ),
                  DropdownButtonFormField<String>(
                      items: [
                        DropdownMenuItem(child: Text('Admin'), value: 'Admin'),
                        DropdownMenuItem(
                          child: Text('SuperUsuario'),
                          value: 'SuperUsuario',
                        ),
                        DropdownMenuItem(
                          child: Text('Developer'),
                          value: 'Developer',
                        ),
                        DropdownMenuItem(
                          child: Text('Jr. Dev'),
                          value: 'Jr. Dev',
                        ),
                      ],
                      onChanged: (value) {
                        print(value);
                        formsValues['role'] = value ?? 'Admin';
                      }),
                  ElevatedButton(
                    child: SizedBox(
                      width: double.infinity,
                      child: Center(child: Text('Guardar')),
                    ),
                    onPressed: () {
                      FocusScope.of(context).requestFocus(
                          FocusNode()); //para que cuando de clik en el boton se esconda el teclado.
                      if (!miFormKey.currentState!.validate()) {
                        print('Formulario no valido.');
                        return;
                      }
                      print(formsValues);
                    },
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
