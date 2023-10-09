import 'package:flutter/material.dart';
import 'login_page.dart';

class AuthorizationPage extends StatelessWidget {
  final bool isAuthorized;
  final String username;
  final String password;

  AuthorizationPage({
    required this.isAuthorized,
    required this.username,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Autorización'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              isAuthorized ? 'Usuario autorizado' : 'Usuario no autorizado',
              style: TextStyle(fontSize: 24),
            ),
            if (isAuthorized)
              Column(
                children: [
                  SizedBox(height: 20),
                  Text('Usuario: $username'),
                  Text('Contraseña: $password'),
                  SizedBox(height: 20),
                  // Agregar una imagen cuando el usuario está verificado.
                  Image.asset(
                    'assets/Verificado.webp', // Ruta relativa a tu imagen verificada.
                    width: 100, // Ajusta el ancho de la imagen según tus necesidades.
                    height: 100, // Ajusta la altura de la imagen según tus necesidades.
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Regresar a la ventana de inicio de sesión.
                    },
                    child: Text('Regresar a Login'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}


