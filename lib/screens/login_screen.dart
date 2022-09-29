import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/alerts.dart';
import '../services/services.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginService = Provider.of<AuthService>(context);
    final socket = Provider.of<SocketProvider>(context);
    final size = MediaQuery.of(context).size;

    String username = '';
    String password = '';

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const FadeInImage(
                //   placeholder: AssetImage('assets/images/no-image.png'),
                //   image: NetworkImage(
                //       'https://opendoodles.s3-us-west-1.amazonaws.com/sitting-reading.png'),
                // ),
                Row(
                  children: const [
                    Text(
                      'Login',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    )
                  ],
                ),
                TextFormField(
                    controller: TextEditingController(),
                    onChanged: (value) {
                      username = value;
                    },
                    decoration: const InputDecoration(
                      icon: Icon(Icons.alternate_email_rounded),
                      hintText: 'Usuario',
                    )),
                SizedBox(
                  height: size.height * .06,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                      hintText: 'Contraseña',
                      icon: Icon(Icons.lock_outline_rounded)),
                  onChanged: (value) {
                    password = value;
                  },
                ),
                SizedBox(
                  height: size.height * .1,
                ),
                MaterialButton(
                  color: const Color(0xff1f54d3),
                  textColor: Colors.white,
                  onPressed: () async {
                    final isLogged =
                        await loginService.login(username, password);
                    if (isLogged) {
                      socket.connect();
                      Navigator.pushReplacementNamed(context, 'home');
                    } else {
                      mostrarAlerta(
                          context, 'Error', 'Usuario o contraseña incorrectos');
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text('Ingresar'),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'register');
                  },
                  child: const Text('Registrarme'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
