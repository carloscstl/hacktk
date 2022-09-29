import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/auth_service.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String username = '', password = '', fullName = '';
    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                    controller: TextEditingController(),
                    onChanged: (value) {
                      username = value;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Usuario',
                    )),
                SizedBox(
                  height: size.height * .06,
                ),
                TextFormField(
                    controller: TextEditingController(),
                    onChanged: (value) {
                      password = value;
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Contraseña',
                    )),
                SizedBox(
                  height: size.height * .06,
                ),
                TextFormField(
                    controller: TextEditingController(),
                    onChanged: (value) {
                      fullName = value;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Nombre Completo',
                    )),
                SizedBox(
                  height: size.height * .06,
                ),
                SizedBox(
                  height: size.height * .1,
                ),
                MaterialButton(
                  onPressed: () async {
                    await authService.register(username, password, fullName);
                  },
                  child: const Text('Registrar Usuario'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
