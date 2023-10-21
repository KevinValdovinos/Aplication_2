import 'package:aplicacion_2/kernel/themes/colors_app.dart';
import 'package:aplicacion_2/kernel/validations/validatinsApp.dart';
import 'package:flutter/material.dart';

class FirstForm extends StatefulWidget {
  const FirstForm({super.key});

  @override
  State<FirstForm> createState() => _FirstFormState();
}

class _FirstFormState extends State<FirstForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isButtonDisabled = true;
  final TextEditingController _fullName = TextEditingController(text: '');
  final TextEditingController _email = TextEditingController(text: '');
  final TextEditingController _age = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Creación de cuenta'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Image.asset(
                'assets/images/Logo-utez.png',
                width: 300,
                height: 100,
              ),
            ),
            Form(
              key: _formKey,
              onChanged: () {
                setState(() {
                  _isButtonDisabled = !_formKey.currentState!.validate();
                });
              },
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(16),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: '¿Cuál es tu nombre?',
                        labelText: 'Nombre completo:*',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor ingresa tu nombre';
                        }
                        return null;
                      },
                      controller: _fullName,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(16),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.email),
                        hintText: '¿Cuál es tu correo?',
                        labelText: 'Correo electrónico:*',
                      ),
                      validator: (value) {
                        RegExp regex = RegExp(ValidationsApp.email);
                        if (value == null || value.isEmpty) {
                          return 'campo obligatorio';
                        } else if (!regex.hasMatch(value)) {
                          return 'Introduce un correo válido';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      controller: _email,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(16),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.lock),
                        hintText: '¿Cuál es tu edad?',
                        labelText: 'Edad:*',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor ingresa tu edad';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      controller: _age,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(300, 50),
                            backgroundColor: ColorsApp.succesColor),
                        onPressed: _isButtonDisabled
                            ? null
                            : () {
                                print('$_fullName $_email $_age');
                              },
                        child: const Text('Crear cuenta')),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
